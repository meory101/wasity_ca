

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';

class SigninUseCase  {
  final AuthRepository repository;
  SigninUseCase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, SigninResponseEntity>> call(
      {required SigninRequestEntity  entity}) async {
    return await repository.signIn(entity: entity);
  }
}