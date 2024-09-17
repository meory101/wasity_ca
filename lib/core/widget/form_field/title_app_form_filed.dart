import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';
import 'package:wasity_captin/core/resource/font_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';
import 'app_form_field.dart';


class TitleAppFormFiled extends StatelessWidget {
  const TitleAppFormFiled(
      {super.key,
      required this.hint,
      required this.title,
      required this.onChanged,
      required this.validator,
      this.initValue,
      this.style,
      this.suffixIcon,
      this.onIconTaped,
      this.maxLines,
      this.minLines,
      this.isRequired,
        this.textInputType,
      this.readOnly,
        this.titleColor,
      this.multiLines});

  final String title, hint;
  final String? Function(String?) onChanged;
  final String? Function(String?) validator;
  final String? suffixIcon, initValue;
  final bool? readOnly;
  final bool? multiLines;
  final TextStyle? style;
  final Function()? onIconTaped;
  final bool? isRequired;
  final int? maxLines;
  final int? minLines;
  final Color? titleColor;
  final TextInputType? textInputType;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
                text: title,
                fontSize: FontSizeManager.fs16,
                fontWeight: FontWeight.w600,
          color: titleColor?? AppColorManager.white,
              ),
        SizedBox(
          height: AppHeightManager.h05,
        ),
        SizedBox(
          child: AppTextFormField(

    style: style,
            readOnly: readOnly,
            suffixIcon: suffixIcon != null && onIconTaped != null
                ? InkWell(
                    onTap: onIconTaped,
                    child: Padding(
                      padding: EdgeInsets.all(AppWidthManager.w2point5),
                      child: SvgPicture.asset(

                        suffixIcon ?? "",
                        // colorFilter: ,
                      ),
                    ),
                  )
                : null,
            initialValue: initValue,
            minLines: multiLines == true ? minLines ?? 5 : 1,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            hintText: hint,
            textInputType: textInputType??TextInputType.name,
          ),
        ),
      ],
    );
  }
}
