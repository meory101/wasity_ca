import 'dart:convert';
import 'dart:io';
/// id : 1
/// name : "somehing"
/// email : "somehing"
/// gender : "somehing"
/// birth_date : "somehing"
/// image : "Oog3Voek0dR9fV37VnByHT8OlrSqwjuc8A25E9MU.jpg"
/// lat : 33
/// long : 33
/// vehicle_id : 1
/// created_at : "2024-08-08T12:15:58.000000Z"
/// updated_at : "2024-08-08T12:17:40.000000Z"

UpdateProfileRequestEntity updateProfileRequestEntityFromJson(String str) => UpdateProfileRequestEntity.fromJson(json.decode(str));
String updateProfileRequestEntityToJson(UpdateProfileRequestEntity data) => json.encode(data.toJson());
class UpdateProfileRequestEntity {
  UpdateProfileRequestEntity({
      String? id,
      String? name, 
      String? email, 
      String? gender, 
      String? birthDate, 
      File? image,
      num? lat, 
      num? long, 
      num? vehicleId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _gender = gender;
    _birthDate = birthDate;
    _image = image;
    _lat = lat;
    _long = long;
    _vehicleId = vehicleId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  set id(String? value) {
    _id = value;
  }

  UpdateProfileRequestEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _gender = json['gender'];
    _birthDate = json['birth_date'];
    _image = json['image'];
    _lat = json['lat'];
    _long = json['long'];
    _vehicleId = json['vehicle_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _gender;
  String? _birthDate;
  File? _image;
  num? _lat;
  num? _long;
  num? _vehicleId;
  String? _createdAt;
  String? _updatedAt;
UpdateProfileRequestEntity copyWith({  String? id,
  String? name,
  String? email,
  String? gender,
  String? birthDate,
  File? image,
  num? lat,
  num? long,
  num? vehicleId,
  String? createdAt,
  String? updatedAt,
}) => UpdateProfileRequestEntity(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  gender: gender ?? _gender,
  birthDate: birthDate ?? _birthDate,
  image: image ?? _image,
  lat: lat ?? _lat,
  long: long ?? _long,
  vehicleId: vehicleId ?? _vehicleId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get gender => _gender;
  String? get birthDate => _birthDate;
  File? get image => _image;
  num? get lat => _lat;
  num? get long => _long;
  num? get vehicleId => _vehicleId;
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
    map['lat'] = _lat;
    map['long'] = _long;
    map['vehicle_id'] = _vehicleId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image'] = _image;
    return map;
  }

  set name(String? value) {
    _name = value;
  }

  set email(String? value) {
    _email = value;
  }

  set gender(String? value) {
    _gender = value;
  }

  set birthDate(String? value) {
    _birthDate = value;
  }

  set image(File? value) {
    _image = value;
  }

  set lat(num? value) {
    _lat = value;
  }

  set long(num? value) {
    _long = value;
  }

  set vehicleId(num? value) {
    _vehicleId = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set updatedAt(String? value) {
    _updatedAt = value;
  }
}