import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';

import '../entity/request/signin_request_entity.dart';

abstract class AuthRepository {
  Future<Either<ApiFailure, SigninResponseEntity>> signIn(
      {required SigninRequestEntity entity});
  Future<Either<ApiFailure, VerifyCodeResponseEntity>> verifyCode(
      {required VerifyCodeRequestEntity entity});
}
