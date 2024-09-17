
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';
import 'package:wasity_captin/feature/map/screen/map_screen.dart';
import 'package:wasity_captin/router/router.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import 'app_form_field.dart';


class TitleMapAppFormFiled extends StatefulWidget {
  const TitleMapAppFormFiled(
      {super.key,
      required this.hint,
      required this.title,
      required this.onChanged,
      required this.validator,
      this.showSelectButton,
        this.focusNode,
      this.initLat,
      this.initLon,
      this.onMarkerTap,
      this.suffixIcon,
      this.readOnly,
      this.multiLines});

  final String title, hint;
  final String? Function(String?) onChanged;
  final String? Function(String?) validator;
  final String? suffixIcon;
  final bool? readOnly;
  final bool? multiLines;
  final bool? showSelectButton;
  final double? initLat, initLon;
  final Function(String?) ?onMarkerTap;
final  FocusNode? focusNode;

  @override
  State<TitleMapAppFormFiled> createState() => _TitleMapAppFormFiledState();
}

class _TitleMapAppFormFiledState extends State<TitleMapAppFormFiled> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: widget.title,
          fontSize: FontSizeManager.fs16,
          fontWeight: FontWeight.w600,
          color:  AppColorManager.textAppColor,
        ),
        SizedBox(
          height: AppHeightManager.h1point5,
        ),
        SizedBox(
          child: AppTextFormField(
            focusNode: widget.focusNode,
            onTap: () async{
            String? latLong = await  Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MapScreen();
            },));
            widget.onMarkerTap!(latLong);
            },
            readOnly: widget.readOnly,
            suffixIcon: widget.suffixIcon != null
                ? InkWell(
                    onTap: () async{
                      String? latLong = await  Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MapScreen(
                          lat: '${widget.initLat}' ,
                          long: '${widget.initLon}' ,
                        );
                      },));
                      widget.onMarkerTap!(latLong);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(AppWidthManager.w2point5),
                      child: SvgPicture.asset(
                        widget.suffixIcon ?? "",
                      ),
                    ),
                  )
                : null,
            initialValue: widget.initLat != null && widget.initLon != null
                ? "${widget.initLat},${widget.initLon}"
                : null,
            minLines: widget.multiLines == true ? 5 : 1,
            validator: widget.validator,
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.next,
            hintText: widget.hint,
            textInputType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}
