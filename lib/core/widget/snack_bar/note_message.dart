import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/icon_manager.dart';
import '../../resource/size_manager.dart';
import '../../storage/shared/shared_pref.dart';
import '../text/app_text_widget.dart';

abstract class NoteMessage {
  static showErrorSnackBar({
    required BuildContext context,
    required String text,
    void Function()? onTap,
    int? duration,
    TextOverflow? overflow,
    int? maxLines,
    bool? refresh,
  }) {
    return context.showFlash(
        duration:  Duration(seconds:duration ?? 2),
        builder: (context, controller) => FlashBar(
              shadowColor: AppColorManager.white,
              surfaceTintColor: AppColorManager.white,
              useSafeArea: false,
              controller: controller,
              position: FlashPosition.top,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadiusManager.r15),
              ),
              margin: EdgeInsets.only(
                  right: AppWidthManager.w3Point8,
                  left: AppWidthManager.w3Point8,
                  top: AppHeightManager.h4),
              title: AppTextWidget(
                text: "${"hi"} ${AppSharedPreferences.getFullName()} !",
                fontSize: FontSizeManager.fs16,
                color: AppColorManager.grey,
                fontWeight: FontWeight.w600,
                overflow: overflow ?? TextOverflow.ellipsis,
                maxLines: maxLines ?? 2,
                softWrap: true,
              ),
              content: Container(
                color: AppColorManager.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextWidget(
                          text: text,
                          fontSize: FontSizeManager.fs15,
                          color: AppColorManager.black,
                          fontWeight: FontWeight.w600,
                          overflow: overflow ?? TextOverflow.ellipsis,
                          maxLines: maxLines ?? 3,
                          softWrap: true,
                        ),
                      ),

                    ]),
              ),
              backgroundColor: AppColorManager.white.withAlpha(235),
            ));
  }

  static showSuccessSnackBar({
    required BuildContext context,
    required String text,
    void Function()? onTap,
    int? duration,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return context.showFlash(
        duration:  Duration(seconds:duration?? 2),
        builder: (context, controller) => FlashBar(
              shadowColor: AppColorManager.white,
              surfaceTintColor: AppColorManager.white,
              useSafeArea: false,
              controller: controller,
              position: FlashPosition.top,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadiusManager.r15),
              ),
              margin: EdgeInsets.only(
                  right: AppWidthManager.w3Point8,
                  left: AppWidthManager.w3Point8,
                  top: AppHeightManager.h4),
              title: AppTextWidget(
                text: "${"hi"} ${AppSharedPreferences.getFullName()} !",
                fontSize: FontSizeManager.fs16,
                color: AppColorManager.grey,
                fontWeight: FontWeight.w600,
                overflow: overflow ?? TextOverflow.ellipsis,
                maxLines: maxLines ?? 2,
                softWrap: true,
              ),
              content: Container(
                color: AppColorManager.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppTextWidget(
                          text: text,
                          fontSize: FontSizeManager.fs15,
                          color: AppColorManager.black,
                          fontWeight: FontWeight.w600,
                          overflow: overflow ?? TextOverflow.ellipsis,
                          maxLines: maxLines ?? 3,
                          softWrap: true,
                        ),
                      ),

                    ]),
              ),
              backgroundColor: AppColorManager.white.withAlpha(235),
            ));
  }
}
