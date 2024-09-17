

import 'package:wasity_captin/core/api/api_error/api_exception.dart';
import 'package:wasity_captin/core/api/api_error/api_status_code.dart';
import 'package:wasity_captin/core/api/api_links.dart';
import 'package:wasity_captin/core/api/api_methods.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/entity/response/delivered_orders_response_entity.dart';


abstract class DeliveredOrdersRemote {
  Future<DeliveredOrdersResponseEntity> getDeliveredOrders();

}

class DeliveredOrdersRemoteImpl extends DeliveredOrdersRemote {
  @override
  Future<DeliveredOrdersResponseEntity> getDeliveredOrders() async
  {
    final response = await ApiMethods()
        .get(url: ApiGetUrl.getDeliveredOrders,);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return deliveredOrdersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }



}
