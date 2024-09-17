import 'dart:convert';
/// delivery_man_id : 3
/// otp_code : 126792
/// updated_at : "2024-08-07T08:39:11.000000Z"
/// created_at : "2024-08-07T08:39:11.000000Z"
/// id : 6

SigninResponseEntity signinResponseEntityFromJson(String str) => SigninResponseEntity.fromJson(json.decode(str));
String signinResponseEntityToJson(SigninResponseEntity data) => json.encode(data.toJson());
class SigninResponseEntity {
  SigninResponseEntity({
      num? deliveryManId, 
      num? otpCode, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _deliveryManId = deliveryManId;
    _otpCode = otpCode;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  SigninResponseEntity.fromJson(dynamic json) {
    print('jsonnnnnnnnnnnnnnnnnnnnnnnn${json['otp_code']}');
    _deliveryManId = json['delivery_man_id'];
    _otpCode = json['otp_code'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
    print("fffffffffffffff");
    print(_otpCode);

  }
  num? _deliveryManId;
  num? _otpCode;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
SigninResponseEntity copyWith({  num? deliveryManId,
  num? otpCode,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => SigninResponseEntity(  deliveryManId: deliveryManId ?? _deliveryManId,
  otpCode: otpCode ?? _otpCode,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);

  num? get deliveryManId => _deliveryManId;
  num? get otpCode => _otpCode;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_man_id'] = _deliveryManId;
    map['otp_code'] = _otpCode;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}