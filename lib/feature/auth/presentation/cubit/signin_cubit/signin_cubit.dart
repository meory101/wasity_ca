
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase usecase;

  SigninCubit({
    required this.usecase,
  }) : super(SigninState.initial());

  //Get App Config
  void signIn(
      {BuildContext? buildContext,
      required SigninRequestEntity entity}) async {
    print('00000000000000000000000');
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
           signinResponseEntity: data
          ),
        );
      },
    );
  }
}
