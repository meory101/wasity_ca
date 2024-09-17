
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasity_captin/core/api/api_error/api_error.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:wasity_captin/feature/profile/domain/usecase/update_profile_usecase.dart';

import '../../../domain/entity/response/update_profile_response_entity.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase usecase;

  UpdateProfileCubit({
    required this.usecase,
  }) : super(UpdateProfileState.initial());

  void updateProfile(
      {BuildContext? buildContext,required UpdateProfileRequestEntity entity}) async {
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

        AppSharedPreferences.cashUserName(username: data.name ?? "");
        AppSharedPreferences.cashUserImage(userImage: data.image??"");
        AppSharedPreferences.cashDefaultAddressId(id: "", location: "${data.lat},${data.long}");
        AppSharedPreferences.cashVehicleId(id: data.vehicleId.toString() ?? "");
        emit(
          state.copyWith(
            status: CubitStatus.success,
           updateProfileResponseEntity: data
          ),
        );
      },
    );
  }
}
