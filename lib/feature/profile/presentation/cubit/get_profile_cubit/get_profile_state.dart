part of 'get_profile_cubit.dart';

class GetProfileState extends Equatable {
  final String error;
  final GetProfileResponseEntity getProfileResponseEntity;
  final CubitStatus status;

  const GetProfileState({
    required this.error,
    required this.getProfileResponseEntity,
    required this.status,
  });

  factory GetProfileState.initial() {
    return GetProfileState(
        getProfileResponseEntity: GetProfileResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  GetProfileState copyWith(
      {String? error,
        GetProfileResponseEntity? getProfileResponseEntity,
      CubitStatus? status}) {
    return GetProfileState(
      error: error ?? this.error,
      getProfileResponseEntity: getProfileResponseEntity ?? this.getProfileResponseEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, getProfileResponseEntity];
  }
}
