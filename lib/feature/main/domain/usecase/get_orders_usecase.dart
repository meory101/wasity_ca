

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';

import '../entity/request/get_orders_request_entity.dart';
import '../entity/response/get_orders_response_entity.dart';
import '../repository/main_home_repository.dart';

class GetOrdersUsecase  {
  final MainHomeRepository repository;
  GetOrdersUsecase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, GetOrdersResponseEntity>> call(
      {required GetOrdersRequestEntity  entity}) async {
    return await repository.getOrders(entity: entity);
  }
}