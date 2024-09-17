
import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/entity/response/delivered_orders_response_entity.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/repository/delivered_orders_repository.dart';

class DeliveredOrdersUseCase  {
  final DeliveredOrdersRepository repository;
  DeliveredOrdersUseCase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, DeliveredOrdersResponseEntity>> call(
     ) async {
    return await repository.getDeliveredOrders();
  }
}