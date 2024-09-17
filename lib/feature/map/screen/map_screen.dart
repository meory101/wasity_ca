import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';
import 'package:wasity_captin/core/resource/size_manager.dart';
import 'package:wasity_captin/core/widget/button/main_app_button.dart';
import 'package:wasity_captin/core/widget/text/app_text_widget.dart';

class MapScreen extends StatefulWidget {
  final String? lat;
  final String? long;
  final bool? showButton;

  const MapScreen({super.key, this.lat, this.long, this.showButton});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? cl;
  double? lat;
  double? long;
  CameraPosition? _kGooglePlex;
  late Set<Marker> myMarkers;

  getLocation() async {
    PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.denied) {
      await Geolocator.requestPermission();
    }
    if (status == PermissionStatus.granted) {
      await getLatLong();
    }
  }

  getLatLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => (value));
    if (widget.lat != null) {
      lat = double.parse(widget.lat!);
      long = double.parse(widget.long!);
    } else {
      lat = cl?.latitude;
      long = cl?.longitude;
    }
    _kGooglePlex = CameraPosition(
      target: LatLng(lat ?? 0.0, long ?? 0.0),
      zoom: 10.4746,
    );
    setState(() {
      myMarkers = {
        Marker(
            markerId: const MarkerId("current-location"),
            position: LatLng(
              lat ?? 0.0,
              long ?? 0.0,
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
      };
    });
  }

  Timer? timer;

  @override
  void initState() {
    timer =
        Timer.periodic(const Duration(seconds: 15), (Timer t) => getLatLong());
    getLocation();
    super.initState();
  }

  onDoneClicked() async {
    String latLong = '$lat*$long';
    Navigator.of(context).pop(latLong);
  }

  @override
  Widget build(BuildContext context) {
    return _kGooglePlex != null
        ? Stack(
            children: [
              GoogleMap(
                onTap: (LatLng) {
                  setState(() {
                    myMarkers.add(
                      Marker(
                        markerId: const MarkerId("1"),
                        position: LatLng,
                      ),
                    );
                    lat = LatLng.latitude;
                    long = LatLng.longitude;
                  });
                },
                markers: myMarkers,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex!,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
              Visibility(
                visible: widget.showButton == true,
                child: Positioned(
                  bottom: 10,
                  left: 10,
                  child: MainAppButton(
                      alignment: Alignment.center,
                      onTap: () {
                        onDoneClicked();
                      },
                      width: AppWidthManager.w40,
                      height: AppHeightManager.h6,
                      color: AppColorManager.yellow,
                      child: const AppTextWidget(
                        text: 'Done',
                        color: AppColorManager.white,
                      )),
                ),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(
              color: AppColorManager.yellow,
            ),
          );
  }
}
