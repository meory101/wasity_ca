import 'dart:convert';
/// number : "0912345688"
/// type : 0

SigninRequestEntity signinRequestEntityFromJson(String str) => SigninRequestEntity.fromJson(json.decode(str));


String signinRequestEntityToJson(SigninRequestEntity data) => json.encode(data.toJson());
class SigninRequestEntity {
  SigninRequestEntity({
      String? number,
      String? type,}){
    _number = number;
    _type = type;
}

  SigninRequestEntity.fromJson(dynamic json) {
    _number = json['number'];
    _type = json['type'];
  }
  String? _number;
  String? _type;
  SigninRequestEntity copyWith({  String? number,
  String? type,
}) => SigninRequestEntity(  number: number ?? _number,
  type: type ?? _type,
);
  String? get number => _number;
  String? get type => _type;

  set  number(String ?value) {
    _number = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['type'] = _type;
    return map;
  }

  set type(String? value) {
    _type = value;
  }
}