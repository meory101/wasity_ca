

import 'package:flutter/rendering.dart';
import 'package:wasity_captin/core/api/api_error/api_exception.dart';
import 'package:wasity_captin/core/api/api_error/api_status_code.dart';
import 'package:wasity_captin/core/api/api_links.dart';
import 'package:wasity_captin/core/api/api_methods.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/verify_code_response_entity.dart';

import '../../../domain/entity/request/signin_request_entity.dart';

abstract class AuthRemote {
  Future<SigninResponseEntity> signIn({required SigninRequestEntity entity});
  Future<VerifyCodeResponseEntity> verifyCode({required VerifyCodeRequestEntity entity});

}

class AuthRemoteImpl extends AuthRemote {
  @override
  Future<SigninResponseEntity> signIn({required SigninRequestEntity entity}) async
  {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.generateOTP, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return signinResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
  @override
  Future<VerifyCodeResponseEntity> verifyCode({required VerifyCodeRequestEntity entity}) async
  {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.clientDeliveryLogin, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return verifyCodeResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}
