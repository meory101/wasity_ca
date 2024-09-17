import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/entity/response/delivered_orders_response_entity.dart';
abstract class DeliveredOrdersRepository {
  Future<Either<ApiFailure, DeliveredOrdersResponseEntity>> getDeliveredOrders();

}
