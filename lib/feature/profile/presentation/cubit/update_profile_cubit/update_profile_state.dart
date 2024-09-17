part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  final String error;
  final UpdateProfileResponseEntity updateProfileResponseEntity;
  final CubitStatus status;

  const UpdateProfileState({
    required this.error,
    required this.updateProfileResponseEntity,
    required this.status,
  });

  factory UpdateProfileState.initial() {
    return UpdateProfileState(
        updateProfileResponseEntity: UpdateProfileResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  UpdateProfileState copyWith(
      {String? error,
        UpdateProfileResponseEntity? updateProfileResponseEntity,
      CubitStatus? status}) {
    return UpdateProfileState(
      error: error ?? this.error,
      updateProfileResponseEntity: updateProfileResponseEntity ?? this.updateProfileResponseEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, updateProfileResponseEntity];
  }
}
