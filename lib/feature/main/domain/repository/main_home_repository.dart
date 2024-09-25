import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';

import '../entity/request/get_orders_request_entity.dart';
import '../entity/response/get_orders_response_entity.dart';


abstract class MainHomeRepository {
  Future<Either<ApiFailure, GetOrdersResponseEntity>> getOrders(
      {required GetOrdersRequestEntity entity});

}
