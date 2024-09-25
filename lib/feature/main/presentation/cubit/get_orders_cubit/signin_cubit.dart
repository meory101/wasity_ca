import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/feature/main/domain/entity/request/get_orders_request_entity.dart';
import 'package:wasity_captin/feature/main/domain/usecase/get_orders_usecase.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/get_orders_cubit/signin_state.dart';


class GetOrdersCubit extends Cubit<GetOrdersState> {
  final GetOrdersUsecase usecase;

  GetOrdersCubit({
    required this.usecase,
  }) : super(GetOrdersState.initial());

   getOrders(
      {BuildContext? buildContext,
      required GetOrdersRequestEntity entity}) async {
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
