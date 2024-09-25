import 'dart:convert';
/// id : 8
/// name : "ff"
/// email : null
/// gender : null
/// birth_date : null
/// image : "uH1PTO7otB4DSN0To5iD5oXAN7b5jySsdoTROmCA.jpg"
/// number : "0991338394"
/// lat : 33.75063921522302
/// long : 36.371791921555996
/// vehicle_id : 4
/// created_at : "2024-08-12T12:47:29.000000Z"
/// updated_at : "2024-08-13T06:17:32.000000Z"

UpdateProfileResponseEntity updateProfileResponseEntityFromJson(String str) => UpdateProfileResponseEntity.fromJson(json.decode(str));
String updateProfileResponseEntityToJson(UpdateProfileResponseEntity data) => json.encode(data.toJson());
class UpdateProfileResponseEntity {
  UpdateProfileResponseEntity({
      num? id, 
      String? name, 
      dynamic email, 
      dynamic gender, 
      dynamic birthDate, 
      String? image, 
      String? number,
    String? lat,
    String? long,
      String? vehicleId,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _gender = gender;
    _birthDate = birthDate;
    _image = image;
    _number = number;
    _lat = lat;
    _long = long;
    _vehicleId = vehicleId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UpdateProfileResponseEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _gender = json['gender'];
    _birthDate = json['birth_date'];
    _image = json['image'];
    _number = json['number'];
    _lat = json['lat'].toString();
    _long = json['long'].toString();
    _vehicleId = json['vehicle_id'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _email;
  dynamic _gender;
  dynamic _birthDate;
  String? _image;
  String? _number;
  String? _lat;
  String? _long;
  String? _vehicleId;
  String? _createdAt;
  String? _updatedAt;
UpdateProfileResponseEntity copyWith({  num? id,
  String? name,
  dynamic email,
  dynamic gender,
  dynamic birthDate,
  String? image,
  String? number,
  String? lat,
  String? long,
  String? vehicleId,
  String? createdAt,
  String? updatedAt,
}) => UpdateProfileResponseEntity(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  gender: gender ?? _gender,
  birthDate: birthDate ?? _birthDate,
  image: image ?? _image,
  number: number ?? _number,
  lat: lat ?? _lat,
  long: long ?? _long,
  vehicleId: vehicleId ?? _vehicleId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get email => _email;
  dynamic get gender => _gender;
  dynamic get birthDate => _birthDate;
  String? get image => _image;
  String? get number => _number;
  String? get lat => _lat;
  String? get long => _long;
  String? get vehicleId => _vehicleId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['gender'] = _gender;
    map['birth_date'] = _birthDate;
    map['image'] = _image;
    map['number'] = _number;
    map['lat'] = _lat;
    map['long'] = _long;
    map['vehicle_id'] = _vehicleId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}