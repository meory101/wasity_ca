import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';
import 'package:wasity_captin/core/resource/constant_manager.dart';
import 'package:wasity_captin/core/resource/enum_manager.dart';
import 'package:wasity_captin/core/resource/font_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/core/widget/image/main_image_widget.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';
import 'package:wasity_captin/feature/map/screen/map_screen.dart';
import 'package:wasity_captin/router/router.dart';

import '../../../../core/resource/icon_manager.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    print(AppSharedPreferences.getUserImage());
    super.initState();
  }

  get() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: AppHeightManager.h7,
                  left: AppWidthManager.w3Point8,
                  right: AppWidthManager.w3Point8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppIconManager.marker,
                          colorFilter: const ColorFilter.mode(
                              AppColorManager.white, BlendMode.srcIn),
                        ),
                      ),
                      SizedBox(width: AppWidthManager.w2,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: 'Delivery By',
                            color: AppColorManager.white,
                            fontWeight: FontWeight.w700,
                            fontSize: FontSizeManager.fs16,
                          ),
                          AppTextWidget(
                            text: EnumManager.vehicleValues[int.parse(
                                    AppSharedPreferences.getVehicleId()
                                            .isNotEmpty
                                        ? AppSharedPreferences.getVehicleId()
                                        : "1")] ??
                                "",
                            color: AppColorManager.white,
                            fontWeight: FontWeight.w500,
                            fontSize: FontSizeManager.fs16,
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNamedScreens.profile);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: AppWidthManager.w15,
                          width: AppWidthManager.w15,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: MainImageWidget(
                            height: AppWidthManager.w15,
                            width: AppWidthManager.w15,
                            imageUrl: AppConstantManager.imageUrl +
                                AppSharedPreferences.getUserImage(),
                          ),
                        ),
                        AppTextWidget(
                          text: AppSharedPreferences.getUserName(),
                          color: AppColorManager.white,
                          fontWeight: FontWeight.w500,
                          fontSize: FontSizeManager.fs14,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadiusManager.r50),
                    color: Colors.grey),
                margin: EdgeInsets.only(
                  top: AppHeightManager.h18,
                ),
                height: AppHeightManager.h70,
                width: AppWidthManager.w100,
                child: const MapScreen()),
            // Container(
            //   height: 100,
            //   width: 100,
            //   color: Colors.red,
            //   margin: EdgeInsets.only(top: AppHeightManager.h15),
            // )
          ],
        ),
      ),
    );
  }
}
