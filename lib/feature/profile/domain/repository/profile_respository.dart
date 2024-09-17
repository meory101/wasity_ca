import 'package:dartz/dartz.dart';
import 'package:wasity_captin/core/api/api_error/api_failures.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';

import '../entity/response/get_profile_respponse_entity.dart';
import '../entity/response/update_profile_response_entity.dart';


abstract class ProfileRepository {
  Future<Either<ApiFailure, GetProfileResponseEntity>> getProfile();
  Future<Either<ApiFailure, UpdateProfileResponseEntity>> updateProfile({required UpdateProfileRequestEntity entity});

}
