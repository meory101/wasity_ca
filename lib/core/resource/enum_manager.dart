

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wasity_captin/core/resource/color_manager.dart';

abstract class EnumManager {

static Map <int,String>vehicleValues = {
  1 : 'Cycle',
  2 : 'Regular Car',
  3 : 'Passenger Car',
  4 : 'Cargo Van',
  5 : 'Truk',
};

static Map <int,String>orderStatus = {
  0 : 'Pending',
  1 : '--',
  2 : 'On The Way',
  3 : 'Delivered',

};
static Map <int,Color>orderStatusColor = {
  0 : Colors.orange ,
  1 : AppColorManager.textAppColor,
  2 : AppColorManager.blue,
  3 : AppColorManager.yellow,

};
}
