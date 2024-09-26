

import 'package:wasity_captin/core/resource/constant_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';

class ApiGetUrl {
  static String getDeliveryManProfile = '${AppConstantManager.baseUrl}getDeliveryManProfile/${AppSharedPreferences.getUserId()}';
  static String getDeliveredOrders = '${AppConstantManager.baseUrl}getDeliveredOrders/${AppSharedPreferences.getUserId()}';

}

class ApiPostUrl {
static String generateOTP = '${AppConstantManager.baseUrl}generateOTP';
static String assignOrderToDelivery = '${AppConstantManager.baseUrl}assignOrderToDelivery';
static String getDeliveryOrders = '${AppConstantManager.baseUrl}getDeliveryOrders';
static String clientDeliveryLogin = '${AppConstantManager.baseUrl}clientDeliveryLogin';
static String updateDeliveryProfile = '${AppConstantManager.baseUrl}updateDeliveryProfile';
}

class ApiDeleteUrl {}

class ApiPutUrl {}
