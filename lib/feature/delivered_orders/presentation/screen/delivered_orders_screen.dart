import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';
import 'package:wasity_captin/core/resource/font_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';

class DeliveredOrdersScreen extends StatefulWidget {
  const DeliveredOrdersScreen({super.key});

  @override
  State<DeliveredOrdersScreen> createState() => _DeliveredOrdersScreenState();
}

class _DeliveredOrdersScreenState extends State<DeliveredOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                text: "Delivered Orders",
                fontSize: FontSizeManager.fs16,
                fontWeight: FontWeight.w500,
                color: AppColorManager.textAppColor,
              ),

             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: List.generate(10, (index) {
                 return Container(
                   padding: EdgeInsets.all(AppWidthManager.w3Point8),

                 );
               }),

             )
            ],
          ),
        ),
      ),
    );
  }
}
