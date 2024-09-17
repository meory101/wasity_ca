import 'package:dartz/dartz.dart';
import 'package:wasity_captin/feature/auth/data/datasource/remote/auth_remote.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, SigninResponseEntity>> signIn(
      {required SigninRequestEntity entity}) async{
    return Connector<SigninResponseEntity>().connect(
      remote: () async {
        final result = await remote.signIn(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, VerifyCodeResponseEntity>> verifyCode(
      {required VerifyCodeRequestEntity entity}) async{
    return Connector<VerifyCodeResponseEntity>().connect(
      remote: () async {
        final result = await remote.verifyCode(entity: entity);
        return Right(result);
      },
    );
  }


}
