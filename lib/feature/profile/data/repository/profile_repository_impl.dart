import 'package:dartz/dartz.dart';
import 'package:wasity_captin/feature/auth/data/datasource/remote/auth_remote.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';
import 'package:wasity_captin/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:wasity_captin/feature/profile/domain/repository/profile_respository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/response/get_profile_respponse_entity.dart';
import '../../domain/entity/response/update_profile_response_entity.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemote remote;

  ProfileRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetProfileResponseEntity>> getProfile(
      ) async{
    return Connector<GetProfileResponseEntity>().connect(
      remote: () async {
        final result = await remote.getProfile();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, UpdateProfileResponseEntity>> updateProfile({required UpdateProfileRequestEntity entity}) async{
    return Connector<UpdateProfileResponseEntity>().connect(
      remote: () async {
        final result = await remote.updateProfile(entity: entity);
        return Right(result);
      },
    );
  }


}
