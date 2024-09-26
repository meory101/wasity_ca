import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasity_captin/core/helper/app_image_helper.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';
import 'package:wasity_captin/core/resource/constant_manager.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/core/resource/enum_manager.dart';
import 'package:wasity_captin/core/resource/font_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/core/widget/button/main_app_button.dart';
import 'package:wasity_captin/core/widget/image/main_image_widget.dart';
import 'package:wasity_captin/core/widget/snack_bar/note_message.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/get_orders_request_entity.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/get_orders_cubit/signin_cubit.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/get_orders_cubit/signin_state.dart';
import 'package:wasity_captin/feature/main/presentation/screen/order_details_screen.dart';
import 'package:wasity_captin/feature/map/screen/map_screen.dart';
import 'package:wasity_captin/feature/profile/presentation/screen/profile_screen.dart';
import 'package:wasity_captin/router/router.dart';

import '../../../../core/resource/icon_manager.dart';
import '../../domain/entity/response/get_orders_response_entity.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<GetOrdersCubit>().getOrders(
              entity: GetOrdersRequestEntity(
                  vehicleId: AppSharedPreferences.getVehicleId()));
        },
        child: SingleChildScrollView(
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
                        SizedBox(
                          width: AppWidthManager.w2,
                        ),
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
                        print(AppConstantManager.imageUrl +
                            (profileData!.image ?? ""));
                        Navigator.of(context)
                            .pushNamed(RouteNamedScreens.profile);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: AppWidthManager.w15,
                              width: AppWidthManager.w15,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: (image?.path ?? "").isEmpty
                                  ? MainImageWidget(
                                      height: AppWidthManager.w15,
                                      width: AppWidthManager.w15,
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
                          SizedBox(
                            height: AppHeightManager.h05,
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
              Padding(
                padding: EdgeInsets.only(
                    top: AppHeightManager.h14, bottom: AppHeightManager.h2),
                child: BlocConsumer<GetOrdersCubit, GetOrdersState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                          context: context, text: "something went wrong");
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return Padding(
                        padding: EdgeInsets.only(top: AppHeightManager.h30),
                        child: const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: AppColorManager.yellow,
                            ),
                          ),
                        ),
                      );
                    }

                    List<Result> orders = state.entity.result ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        List orderLocationPoints = [];
                        Order? order = orders[index].orderDetails?.order;
                        List<Products>? products =
                            orders[index].orderDetails?.products ?? [];

                        return Container(
                            padding: EdgeInsets.all(
                              AppWidthManager.w3Point8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColorManager.white.withAlpha(90),
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r10),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: AppHeightManager.h1,
                                horizontal: AppWidthManager.w3Point8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextWidget(
                                      text: EnumManager.orderStatus[
                                              order?.statusCode ?? 0] ??
                                          "",
                                      color: EnumManager.orderStatusColor[
                                          order?.statusCode ?? 0],
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSizeManager.fs15,
                                    ),
                                    AppTextWidget(
                                      text: order?.orderNumber ?? "",
                                      fontWeight: FontWeight.w500,
                                      color: AppColorManager.white,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppHeightManager.h1point8,
                                ),
                                SizedBox(
                                  height: AppHeightManager.h1point8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(products.length, (index) {
                                    orderLocationPoints.add([
                                      products[index].branch?.lat,
                                      products[index].branch?.long
                                    ]);
                                    print(
                                      AppConstantManager.imageUrl +
                                          (products[index].product?.image ??
                                              ""),
                                    );
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: AppHeightManager.h1point8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: AppWidthManager.w25,
                                            width: AppWidthManager.w25,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppRadiusManager.r10),
                                                shape: BoxShape.rectangle),
                                            child: MainImageWidget(
                                              height: AppWidthManager.w25,
                                              width: AppWidthManager.w25,
                                              imageUrl:
                                                  AppConstantManager.imageUrl +
                                                      (products[index]
                                                              .product
                                                              ?.image ??
                                                          ""),
                                            ),
                                          ),
                                          SizedBox(
                                            width: AppWidthManager.w3Point8,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppTextWidget(
                                                  text: products[index]
                                                          .product
                                                          ?.name ??
                                                      "",
                                                  fontSize:
                                                      FontSizeManager.fs16,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColorManager.white,
                                                ),
                                                AppTextWidget(
                                                  text: products[index]
                                                          .product
                                                          ?.desc ??
                                                      "",
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColorManager.white,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(
                                  height: AppHeightManager.h1point8,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: MainAppButton(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          RouteNamedScreens.orderDetails,
                                          arguments: OrderDetailsArgs(
                                              order: orders[index].orderDetails,
                                              orderLocationPoints:
                                                  orderLocationPoints));
                                    },
                                    alignment: Alignment.center,
                                    color: AppColorManager.green,
                                    height: AppHeightManager.h4,
                                    width: AppWidthManager.w40,
                                    borderRadius: BorderRadius.circular(
                                        AppRadiusManager.r10),
                                    child: AppTextWidget(
                                      text: 'More Details',
                                      color: AppColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: FontSizeManager.fs14,
                                    ),
                                  ),
                                )
                              ],
                            ));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
