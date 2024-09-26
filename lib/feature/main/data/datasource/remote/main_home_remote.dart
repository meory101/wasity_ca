

import 'package:wasity_captin/core/api/api_error/api_exception.dart';
import 'package:wasity_captin/core/api/api_error/api_status_code.dart';
import 'package:wasity_captin/core/api/api_links.dart';
import 'package:wasity_captin/core/api/api_methods.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/take_order_request_entity.dart';

import '../../../domain/entity/request/get_orders_request_entity.dart';
import '../../../domain/entity/response/get_orders_response_entity.dart';


abstract class MainHomeRemote {
  Future<GetOrdersResponseEntity> getOrders({required GetOrdersRequestEntity entity});
  Future<bool> takeOrder({required TakeOrderRequestEntity entity});

}

class MainHomeRemoteImpl extends MainHomeRemote {
  @override
  Future<GetOrdersResponseEntity> getOrders({required GetOrdersRequestEntity entity}) async
  {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.getDeliveryOrders, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getOrdersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> takeOrder({required TakeOrderRequestEntity entity}) async{
    final response = await ApiMethods()
        .post(url: ApiPostUrl.assignOrderToDelivery, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }


}
