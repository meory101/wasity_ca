import 'package:flutter/rendering.dart';
import 'package:http/src/response.dart';
import 'package:wasity_captin/core/api/api_error/api_exception.dart';
import 'package:wasity_captin/core/api/api_error/api_status_code.dart';
import 'package:wasity_captin/core/api/api_links.dart';
import 'package:wasity_captin/core/api/api_methods.dart';
import 'package:wasity_captin/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:wasity_captin/feature/profile/presentation/screen/profile_screen.dart';
import 'package:http/http.dart' as http;
import '../../../domain/entity/response/get_profile_respponse_entity.dart';
import '../../../domain/entity/response/update_profile_response_entity.dart';

abstract class ProfileRemote {
  Future<GetProfileResponseEntity> getProfile();

  Future<UpdateProfileResponseEntity> updateProfile({required UpdateProfileRequestEntity entity});
}

class ProfileRemoteImpl extends ProfileRemote {
  @override
  Future<GetProfileResponseEntity> getProfile() async {
    final response =
        await ApiMethods().get(url: ApiGetUrl.getDeliveryManProfile);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getProfileRespponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<UpdateProfileResponseEntity> updateProfile(
      {required UpdateProfileRequestEntity entity}) async {
    final http.Response response;
    if (image != null) {
      response = await ApiMethods().postWithFile(
          url: ApiPostUrl.updateDeliveryProfile, data: data, file: image!);
    } else {
      response = await ApiMethods()
          .post(url: ApiPostUrl.updateDeliveryProfile, body: data);
    }
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return updateProfileResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
