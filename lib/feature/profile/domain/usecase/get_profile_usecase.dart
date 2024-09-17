

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';
import 'package:wasity_captin/feature/profile/domain/repository/profile_respository.dart';

import '../entity/response/get_profile_respponse_entity.dart';


class GetProfileUseCase  {
  final ProfileRepository repository;
  GetProfileUseCase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, GetProfileResponseEntity>> call(
     ) async {
    return await repository.getProfile();
  }
}