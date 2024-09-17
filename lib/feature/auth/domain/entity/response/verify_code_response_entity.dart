import 'dart:convert';
/// token : "4|ic3hIfYqxGcayKNFPHn9tQF2am62zVM77YqekBeN7a6addc3"

VerifyCodeResponseEntity verifyCodeResponseEntityFromJson(String str) => VerifyCodeResponseEntity.fromJson(json.decode(str));
String verifyCodeResponseEntityToJson(VerifyCodeResponseEntity data) => json.encode(data.toJson());
class VerifyCodeResponseEntity {
  VerifyCodeResponseEntity({
      String? token,}){
    _token = token;
}

  VerifyCodeResponseEntity.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
VerifyCodeResponseEntity copyWith({  String? token,
}) => VerifyCodeResponseEntity(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}