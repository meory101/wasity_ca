import 'package:dartz/dartz.dart';
import 'package:wasity_captin/feature/delivered_orders/data/datasource/remote/delivered_orders_remote.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/entity/response/delivered_orders_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/repository/delivered_orders_repository.dart';

class DeliveredOrdersRepositoryImpl implements DeliveredOrdersRepository {
  final DeliveredOrdersRemote remote;

  DeliveredOrdersRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, DeliveredOrdersResponseEntity>> getDeliveredOrders() async{
    return Connector<DeliveredOrdersResponseEntity>().connect(
      remote: () async {
        final result = await remote.getDeliveredOrders();
        return Right(result);
      },
    );
  }
}
