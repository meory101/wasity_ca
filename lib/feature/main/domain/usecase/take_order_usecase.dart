

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/take_order_request_entity.dart';

import '../entity/request/get_orders_request_entity.dart';
import '../entity/response/get_orders_response_entity.dart';
import '../repository/main_home_repository.dart';

class TakeOrderUsecase  {
  final MainHomeRepository repository;
  TakeOrderUsecase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, bool>> call(
      {required TakeOrderRequestEntity  entity}) async {
    return await repository.takeOrder(entity: entity);
  }
}