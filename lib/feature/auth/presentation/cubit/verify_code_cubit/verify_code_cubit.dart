
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/verify_code_usecase.dart';

import '../../../domain/entity/request/verify_code_request_entity.dart';
import '../../../domain/entity/response/verify_code_response_entity.dart';
part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyCodeUseCase usecase;

  VerifyCodeCubit({
    required this.usecase,
  }) : super(VerifyCodeState.initial());

  //Get App Config
  void verifyCode(
      {BuildContext? buildContext,
      required VerifyCodeRequestEntity entity}) async {
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
           verifyCodeResponseEntity: data
          ),
        );
      },
    );
  }
}
