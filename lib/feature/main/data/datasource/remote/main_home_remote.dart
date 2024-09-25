

import 'package:wasity_captin/core/api/api_error/api_exception.dart';
import 'package:wasity_captin/core/api/api_error/api_status_code.dart';
import 'package:wasity_captin/core/api/api_links.dart';
import 'package:wasity_captin/core/api/api_methods.dart';

import '../../../domain/entity/request/get_orders_request_entity.dart';
import '../../../domain/entity/response/get_orders_response_entity.dart';


abstract class MainHomeRemote {
  Future<GetOrdersResponseEntity> getOrders({required GetOrdersRequestEntity entity});

}

class MainHomeRemoteImpl extends MainHomeRemote {
  @override
  Future<GetOrdersResponseEntity> getOrders({required GetOrdersRequestEntity entity}) async
  {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.getDeliveryOrders, body: entity.toJson());
    print(response.statusCode);
    print(response.body);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getOrdersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}
