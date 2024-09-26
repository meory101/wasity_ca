import 'package:dartz/dartz.dart';
import 'package:wasity_captin/feature/main/data/datasource/remote/main_home_remote.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/take_order_request_entity.dart';
import '../../../../../core/api/api_error/api_failures.dart';
import '../../../../../core/api/connector.dart';
import '../../../domain/entity/request/get_orders_request_entity.dart';
import '../../../domain/entity/response/get_orders_response_entity.dart';
import '../../../domain/repository/main_home_repository.dart';

class MainHomeRepositoryImpl implements MainHomeRepository {
  final MainHomeRemote remote;

  MainHomeRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetOrdersResponseEntity>> getOrders(
      {required GetOrdersRequestEntity entity}) async{
    return Connector<GetOrdersResponseEntity>().connect(
      remote: () async {
        final result = await remote.getOrders(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> takeOrder({required TakeOrderRequestEntity entity}) {
    return Connector<bool>().connect(
    remote: () async {
    final result = await remote.takeOrder(entity: entity);
    return Right(result);
    },
    );
  }




}
