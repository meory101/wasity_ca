import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasity_captin/core/helper/app_image_helper.dart';
import 'package:wasity_captin/core/resource/constant_manager.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/core/resource/enum_manager.dart';
import 'package:wasity_captin/core/resource/icon_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/core/widget/form_field/title_map_app_form_filed.dart';
import 'package:wasity_captin/core/widget/image/main_image_widget.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:wasity_captin/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/response/get_profile_respponse_entity.dart';

Map data = {};
File? image;
GetProfileResponseEntity? profileData;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UpdateProfileRequestEntity entity = UpdateProfileRequestEntity();
  String? name;
  String? gender;
  String? number;

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isContinuePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorManager.backgroundWhite,
        body: BlocBuilder<GetProfileCubit, GetProfileState>(
          builder: (context, state) {
            profileData = state.getProfileResponseEntity;

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Form(
                key: formKey,
                child: Stack(
                  children: [
                    Container(
                      width: AppWidthManager.w100,
                      height: AppHeightManager.h40,
                      decoration: BoxDecoration(
                        color: AppColorManager.background,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppRadiusManager.r15),
                          bottomRight: Radius.circular(AppRadiusManager.r15),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: IconButton(
                            onPressed: () {
                              profileData = GetProfileResponseEntity();
                              image =null;
                              data = {};
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  RouteNamedScreens.signin, (route) => false);
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: AppColorManager.white,
                              size: 20,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              image = await AppImageHelper.pickImageFrom(
                                  source: ImageSource.gallery);
                              setState(() {});
                            },
                            child: Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(top: AppHeightManager.h10),
                                height: AppWidthManager.w25,
                                width: AppWidthManager.w25,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: (image?.path ?? "").isEmpty
                                    ? MainImageWidget(
                                        height: AppWidthManager.w25,
                                        width: AppWidthManager.w25,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            '${AppConstantManager.imageUrl}${profileData?.image}',
                                      )
                                    : Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                        height: AppWidthManager.w25,
                                        width: AppWidthManager.w25,
                                      )),
                          ),
                          SizedBox(
                            height: AppHeightManager.h08,
                          ),
                          AppTextWidget(
                            text: AppSharedPreferences.getPhoneNumber(),
                            color: AppColorManager.white,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSizeManager.fs14,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(AppWidthManager.w5),
                      margin: EdgeInsets.only(
                          top: AppHeightManager.h30,
                          left: AppWidthManager.w3Point8,
                          right: AppWidthManager.w3Point8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColorManager.greyWithOpacity6,
                              blurRadius: 7)
                        ],
                        color: AppColorManager.white,
                        borderRadius: BorderRadius.circular(
                          AppRadiusManager.r20,
                        ),
                      ),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppHeightManager.h2,
                            ),
                            TitleAppFormFiled(
                              titleColor: AppColorManager.textAppColor,
                              initValue: profileData?.name ?? "",
                              isRequired: true,
                              hint: "name",
                              title: "name",
                              validator: (value) {
                                if ((value ?? "").isEmpty) {
                                  return "emptyFiled";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  entity.name = value ?? "";
                                  data['name'] = value ?? "";
                                });
                                return value;
                              },
                            ),
                            SizedBox(
                              height: AppHeightManager.h2point5,
                            ),
                            TitleMapAppFormFiled(
                              // focusNode: mapFocusNode,
                              suffixIcon: AppIconManager.marker,
                              hint: "deliver in",
                              title: "deliver in",
                              readOnly: true,
                              initLat: entity.lat?.toDouble() ??
                                  profileData?.lat?.toDouble(),

                              initLon: entity.long?.toDouble() ??
                                  profileData?.long?.toDouble(),
                              validator: (value) {
                                if ((value ?? "").isEmpty) {
                                  return "emptyFiled";
                                }
                                return null;
                              },
                              onMarkerTap: (location) {
                                if (location != null) {
                                  entity.lat =
                                      double.parse(location.split('*').first);
                                  entity.long =
                                      double.parse(location.split('*').last);
                                  data['lat'] = entity.lat.toString();
                                  data['long'] = entity.long.toString();
                                  setState(() {});
                                }
                              },
                              onChanged: (value) {
                                return value;
                              },
                            ),
                            SizedBox(
                              height: AppHeightManager.h2point5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: "vehicle",
                                  fontSize: FontSizeManager.fs16,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: AppHeightManager.h05,
                                ),
                                MainDropdownWidget(
                                  hintFontColor: (EnumManager.vehicleValues[
                                              profileData?.vehicleId]) ==
                                          null
                                      ? AppColorManager.greyWithOpacity6
                                      : AppColorManager.textAppColor,
                                  hint: EnumManager.vehicleValues[
                                          profileData?.vehicleId] ??
                                      "vehicle",
                                  options: [
                                    NameAndId(
                                        name:
                                            EnumManager.vehicleValues[1] ?? "",
                                        id: "1"),
                                    NameAndId(
                                        name:
                                            EnumManager.vehicleValues[2] ?? "",
                                        id: "2"),
                                    NameAndId(
                                        name:
                                            EnumManager.vehicleValues[3] ?? "",
                                        id: "3"),
                                    NameAndId(
                                        name:
                                            EnumManager.vehicleValues[4] ?? "",
                                        id: "4"),
                                    NameAndId(
                                        name:
                                            EnumManager.vehicleValues[5] ?? "",
                                        id: "5"),
                                  ],
                                  borderColor: entity.vehicleId == null &&
                                          data['vehicle_id'] == null &&
                                          isContinuePressed == true
                                      ? Colors.red
                                      : AppColorManager.greyWithOpacity6,
                                  onChanged: (value) {
                                    print(value?.id);
                                    print('00000000000000000000000000000');
                                    data['vehicle_id'] = value?.id;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppHeightManager.h4,
                            ),
                            BlocConsumer<UpdateProfileCubit,
                                UpdateProfileState>(
                              listener: (context, state) {
                                if (state.status == CubitStatus.success) {
                                  data = {};

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      RouteNamedScreens.mainHome,
                                      (route) => false);
                                }
                              },
                              builder: (context, state) {
                                if (state.status == CubitStatus.loading) {
                                  return Center(
                                    child: SizedBox(
                                      height: AppHeightManager.h6,
                                      width: AppWidthManager.w11,
                                      child: const CircularProgressIndicator(
                                        color: AppColorManager.yellow,
                                      ),
                                    ),
                                  );
                                }
                                return DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: AppColorManager.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppHeightManager.h2point5),
                                    child: MainAppButton(
                                      onTap: () {
                                        setState(() {
                                          isContinuePressed = true;
                                        });
                                        entity.id = profileData?.id.toString();
                                        data['id'] = profileData?.id.toString();
                                        if (formKey.currentState!.validate() &&
                                            data['vehicle_id'] != null) {
                                          context
                                              .read<UpdateProfileCubit>()
                                              .updateProfile(entity: entity);
                                        }
                                      },
                                      height: AppHeightManager.h6,
                                      alignment: Alignment.center,
                                      color: AppColorManager.yellow,
                                      borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r15),
                                      child: AppTextWidget(
                                          text: "continue",
                                          color: AppColorManager.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: FontSizeManager.fs16),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
