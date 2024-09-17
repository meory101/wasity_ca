

import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:wasity_captin/feature/profile/domain/repository/profile_respository.dart';

import '../entity/response/update_profile_response_entity.dart';


class UpdateProfileUseCase  {
  final ProfileRepository repository;
  UpdateProfileUseCase({
    required this.repository,
  });
  @override
  Future<Either<ApiFailure, UpdateProfileResponseEntity>> call({required UpdateProfileRequestEntity entity}) async {
    return await repository.updateProfile(entity: entity);
  }
}