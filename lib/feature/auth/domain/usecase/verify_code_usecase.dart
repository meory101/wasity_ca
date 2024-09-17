

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';

class VerifyCodeUseCase  {
  final AuthRepository repository;
  VerifyCodeUseCase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, VerifyCodeResponseEntity>> call(
      {required VerifyCodeRequestEntity entity}) async {
    return await repository.verifyCode(entity: entity);
  }
}