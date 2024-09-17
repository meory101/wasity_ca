part of 'verify_code_cubit.dart';

class VerifyCodeState extends Equatable {
  final String error;
  final VerifyCodeResponseEntity verifyCodeResponseEntity;
  final CubitStatus status;

  const VerifyCodeState({
    required this.error,
    required this.verifyCodeResponseEntity,
    required this.status,
  });

  factory VerifyCodeState.initial() {
    return VerifyCodeState(
        verifyCodeResponseEntity: VerifyCodeResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  VerifyCodeState copyWith(
      {String? error,
        VerifyCodeResponseEntity? verifyCodeResponseEntity,
      CubitStatus? status}) {
    return VerifyCodeState(
      error: error ?? this.error,
      verifyCodeResponseEntity: verifyCodeResponseEntity ?? this.verifyCodeResponseEntity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [error, status, verifyCodeResponseEntity];
  }
}
