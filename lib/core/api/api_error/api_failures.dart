import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class ApiFailure extends Equatable {}

class OfflineApiFailure extends ApiFailure {
  final String message;
  OfflineApiFailure({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}

class ApiServerFailure extends ApiFailure {
  final Response? response;
  ApiServerFailure({
    this.response,
  });

  @override
  List<Object?> get props => [response];
}

class EmptyApiCacheFailure extends ApiFailure {
  @override
  List<Object?> get props => [];
}
class ApiServerTimeOut extends ApiFailure {
  @override
  List<Object?> get props => [];
}

class ApiTimeOutFailure extends ApiFailure {
  final Response? response;
  ApiTimeOutFailure({
    this.response,
  });

  @override
  List<Object?> get props => [];
}

class WrongApiDataFailure extends ApiFailure {
  @override
  List<Object?> get props => [];
}
