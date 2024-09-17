part of 'delivered_orders_cubit.dart';

class DeliveredOrdersState extends Equatable {
  final String error;
  final DeliveredOrdersResponseEntity deliveredOrdersResponseEntity;
  final CubitStatus status;

  const DeliveredOrdersState({
    required this.error,
    required this.deliveredOrdersResponseEntity,
    required this.status,
  });

  factory DeliveredOrdersState.initial() {
    return DeliveredOrdersState(
        deliveredOrdersResponseEntity: DeliveredOrdersResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  DeliveredOrdersState copyWith(
      {String? error,
        DeliveredOrdersResponseEntity? deliveredOrdersResponseEntity,
      CubitStatus? status}) {
    return DeliveredOrdersState(
      error: error ?? this.error,
      deliveredOrdersResponseEntity: deliveredOrdersResponseEntity ?? this.deliveredOrdersResponseEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, DeliveredOrdersResponseEntity];
  }
}
