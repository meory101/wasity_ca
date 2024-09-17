
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/entity/response/delivered_orders_response_entity.dart';

import '../../../domain/entity/response/delivered_orders_response_entity.dart';
import '../../../domain/usecase/delivered_orders_usecase.dart';
part 'delivered_orders_state.dart';

class DeliveredOrdersCubit extends Cubit<DeliveredOrdersState> {
  final DeliveredOrdersUseCase usecase;

  DeliveredOrdersCubit({
    required this.usecase,
  }) : super(DeliveredOrdersState.initial());

   getDeliveredOrder(
      {BuildContext? buildContext,
    }) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase();
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
              deliveredOrdersResponseEntity: data
          ),
        );
      },
    );
  }
}
