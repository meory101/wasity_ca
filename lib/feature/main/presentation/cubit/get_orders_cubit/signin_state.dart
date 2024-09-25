
import 'package:equatable/equatable.dart';
import 'package:wasity_captin/feature/main/domain/entity/response/get_orders_response_entity.dart';

import '../../../../../core/resource/cubit_status_manager.dart';

class GetOrdersState extends Equatable {
  final String error;
  final GetOrdersResponseEntity entity;
  final CubitStatus status;

  const GetOrdersState({
    required this.error,
    required this.entity,
    required this.status,
  });

  factory GetOrdersState.initial() {
    return GetOrdersState(
        entity: GetOrdersResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  GetOrdersState copyWith(
      {String? error,
        GetOrdersResponseEntity? entity,
      CubitStatus? status}) {
    return GetOrdersState(
      error: error ?? this.error,
      entity: entity ?? this.entity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, GetOrdersResponseEntity];
  }
}
