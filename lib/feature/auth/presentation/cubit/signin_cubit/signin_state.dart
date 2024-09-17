part of 'signin_cubit.dart';

class SigninState extends Equatable {
  final String error;
  final SigninResponseEntity signinResponseEntity;
  final CubitStatus status;

  const SigninState({
    required this.error,
    required this.signinResponseEntity,
    required this.status,
  });

  factory SigninState.initial() {
    return SigninState(
        signinResponseEntity: SigninResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  SigninState copyWith(
      {String? error,
        SigninResponseEntity? signinResponseEntity,
      CubitStatus? status}) {
    return SigninState(
      error: error ?? this.error,
      signinResponseEntity: signinResponseEntity ?? this.signinResponseEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, signinResponseEntity];
  }
}
