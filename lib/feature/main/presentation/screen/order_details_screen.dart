import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/core/resource/enum_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/core/widget/snack_bar/note_message.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/take_order_request_entity.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/take_order_cubit/take_order_cubit.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/take_order_cubit/take_order_state.dart';
import 'package:wasity_captin/feature/map/screen/map_screen.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../domain/entity/response/get_orders_response_entity.dart';
import 'package:http/http.dart' as http;

class OrderDetailsScreen extends StatefulWidget {
  final OrderDetailsArgs _args;

  const OrderDetailsScreen({super.key, required OrderDetailsArgs args})
      : _args = args;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    print(widget._args.orderLocationPoints);
    print('location points');
    getMarkers();

    super.initState();
  }

  Set<Marker> markers = {};
  Position? position;
  List points = [];

  getMarkers() async {
    for (var element in widget._args.orderLocationPoints) {
      points.add([
        element[0].toDouble(),
        element[1].toDouble(),
      ]);
      markers.add(
        Marker(
          markerId: const MarkerId(""),
          position: LatLng(
            element[0].toDouble(),
            element[1].toDouble(),
          ),
        ),
      );
    }
    markers.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(100),
        markerId: const MarkerId(
          "70",
        ),
        position: LatLng(
          (widget._args.order?.address?.lat ?? 0.0).toDouble(),
          (widget._args.order?.address?.long ?? 0.0).toDouble(),
        ),
      ),
    );
    await Geolocator.getCurrentPosition().then((value) {
      position = value;
      print(value);
      print('0000000000000000000000');
      markers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(30),
          markerId: const MarkerId(
            "71",
          ),
          position: LatLng(
            (value.latitude ?? 0.0).toDouble(),
            (value.longitude ?? 0.0).toDouble(),
          ),
        ),
      );
      setState(() {});
      return null;
    });
  }

  checkPath() async {
    if (position == null) {
      NoteMessage.showErrorSnackBar(
          context: context, text: "Please Wait To Get Your Current Position");
    }
    print(points);
    print([position?.latitude ?? 0.0, position?.longitude ?? 0.0]);
    print([
      (widget._args.order?.address?.lat ?? 0.0).toDouble(),
      (widget._args.order?.address?.long ?? 0.0).toDouble(),
    ]);

    http.Response response = await http.post(
        Uri.parse('http://192.168.215.164:5000/api/findOptimalPath'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'points': points,
          'startPoint': [position?.latitude ?? 0.0, position?.longitude ?? 0.0],
          'targetPoint': [
            (widget._args.order?.address?.lat ?? 0.0).toDouble(),
            (widget._args.order?.address?.long ?? 0.0).toDouble(),
          ]
        }));
    print(response.statusCode);
    print(jsonDecode(jsonEncode(response.body)));
    print('response body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<TakeOrderCubit, TakeOrderState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(
                    context: context, text: "Something Went Wrong");
              }
              if (state.status == CubitStatus.success) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteNamedScreens.mainHome, (route) => false);
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return const CircularProgressIndicator(
                  color: AppColorManager.yellow,
                );
              }
              return MainAppButton(
                onTap: () {
                  context.read<TakeOrderCubit>().takeOrder(
                        entity: TakeOrderRequestEntity(
                          id: widget._args.order?.order?.id.toString(),
                          deliveryManId: AppSharedPreferences.getUserId(),
                          statusCode: "2",
                        ),
                      );
                },
                alignment: Alignment.center,
                color: AppColorManager.yellow,
                height: AppHeightManager.h4,
                width: AppWidthManager.w40,
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                child: AppTextWidget(
                  text: 'Take Order',
                  color: AppColorManager.white,
                  fontWeight: FontWeight.w500,
                  fontSize: FontSizeManager.fs14,
                ),
              );
            },
          ),
          SizedBox(
            width: AppWidthManager.w3Point8,
          ),
          MainAppButton(
            onTap: () {
              checkPath();
            },
            alignment: Alignment.center,
            color: AppColorManager.green,
            height: AppHeightManager.h4,
            width: AppWidthManager.w40,
            borderRadius: BorderRadius.circular(AppRadiusManager.r10),
            child: AppTextWidget(
              text: 'Check Path',
              color: AppColorManager.white,
              fontWeight: FontWeight.w500,
              fontSize: FontSizeManager.fs14,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(AppWidthManager.w3Point8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  AppRadiusManager.r20,
                ),
              ),
              height: AppHeightManager.h60,
              width: AppWidthManager.w100,
              child: GoogleMap(
                markers: markers,
                initialCameraPosition: CameraPosition(
                  target: markers.first.position,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppHeightManager.h1,
                  horizontal: AppWidthManager.w3Point8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppTextWidget(
                        text: "Order Number",
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      AppTextWidget(
                        text: widget._args.order?.order?.orderNumber ?? "",
                        fontSize: FontSizeManager.fs14,
                        fontWeight: FontWeight.w500,
                        color: AppColorManager.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppHeightManager.h2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        text: widget._args.order?.client?.number ?? "",
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                      InkWell(
                        overlayColor: const MaterialStatePropertyAll(
                            AppColorManager.transparent),
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "tel://${widget._args.order?.client?.number}"));
                        },
                        child: Container(
                          padding: EdgeInsets.all(AppWidthManager.w1),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: const Icon(
                            Icons.call,
                            color: AppColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppHeightManager.h2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: "User Ordered This Order ",
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      AppTextWidget(
                        text: widget._args.order?.order?.createdAt ?? "",
                        fontSize: FontSizeManager.fs14,
                        fontWeight: FontWeight.w500,
                        color: AppColorManager.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: "Sub Total Price",
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      AppTextWidget(
                        text:
                            '${widget._args.order?.order?.subTotal.toString() ?? ""} SYP',
                        fontSize: FontSizeManager.fs18,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: "Order Status",
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w700,
                        color: AppColorManager.white,
                      ),
                      SizedBox(
                        width: AppWidthManager.w3Point8,
                      ),
                      AppTextWidget(
                        text: EnumManager.orderStatus[
                                widget._args.order?.order?.statusCode] ??
                            "",
                        fontSize: FontSizeManager.fs17,
                        fontWeight: FontWeight.w700,
                        color: EnumManager.orderStatusColor[
                                widget._args.order?.order?.statusCode] ??
                            AppColorManager.white,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetailsArgs {
  List orderLocationPoints = [];
  OrderDetails? order;

  OrderDetailsArgs({required this.orderLocationPoints, required this.order});
}
