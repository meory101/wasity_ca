import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/take_order_request_entity.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/take_order_cubit/take_order_state.dart';
import '../../../domain/usecase/take_order_usecase.dart';


class TakeOrderCubit extends Cubit<TakeOrderState> {
  final TakeOrderUsecase usecase;

  TakeOrderCubit({
    required this.usecase,
  }) : super(TakeOrderState.initial());

   takeOrder(
      {BuildContext? buildContext,
      required TakeOrderRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await usecase(entity: entity);
    //!Check if Bloc Closed
    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await ApiErrorHandler.mapFailure(
            buildContext: buildContext, failure: failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            status: CubitStatus.success,
              entity:data

          ),
        );
      },
    );
  }
}
