import 'package:http/http.dart';

class ApiServerException implements Exception {
  Response? response;
  ApiServerException({
    this.response,
  });
}
class TimeOutException implements Exception {

}

class EmptyApiCacheException implements Exception {}

class OfflineApiException implements Exception {}
