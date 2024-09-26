
import 'package:equatable/equatable.dart';
import 'package:wasity_captin/feature/main/domain/entity/response/get_orders_response_entity.dart';
import '../../../../../core/resource/cubit_status_manager.dart';

class TakeOrderState extends Equatable {
  final String error;
  final bool entity;
  final CubitStatus status;

  const TakeOrderState({
    required this.error,
    required this.entity,
    required this.status,
  });

  factory TakeOrderState.initial() {
    return const TakeOrderState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  TakeOrderState copyWith(
      {String? error,
        bool? entity,
      CubitStatus? status}) {
    return TakeOrderState(
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
