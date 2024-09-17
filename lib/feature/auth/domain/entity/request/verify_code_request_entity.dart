import 'dart:convert';
/// number : "0911"
/// type : 1
/// otp_code : "539485"

VerifyCodeRequestEntity verifyCodeRequestEntityFromJson(String str) => VerifyCodeRequestEntity.fromJson(json.decode(str));
String verifyCodeRequestEntityToJson(VerifyCodeRequestEntity data) => json.encode(data.toJson());
class VerifyCodeRequestEntity {
  VerifyCodeRequestEntity({
      String? number, 
      String? type, 
      String? otpCode,}){
    _number = number;
    _type = type;
    _otpCode = otpCode;
}

  set number(String? value) {
    _number = value;
  }

  VerifyCodeRequestEntity.fromJson(dynamic json) {
    _number = json['number'];
    _type = json['type'];
    _otpCode = json['otp_code'];
  }
  String? _number;
  String? _type;
  String? _otpCode;
VerifyCodeRequestEntity copyWith({  String? number,
  String? type,
  String? otpCode,
}) => VerifyCodeRequestEntity(  number: number ?? _number,
  type: type ?? _type,
  otpCode: otpCode ?? _otpCode,
);
  String? get number => _number;
  String? get type => _type;
  String? get otpCode => _otpCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['type'] = _type;
    map['otp_code'] = _otpCode;
    return map;
  }

  set type(String? value) {
    _type = value;
  }

  set otpCode(String? value) {
    _otpCode = value;
  }
}