import 'dart:convert';
/// id : 3
/// name : "ffffffffffffffffffff"
/// email : "للل"
/// gender : "للل"
/// birth_date : "للل"
/// image : "Oog3Voek0dR9fV37VnByHT8OlrSqwjuc8A25E9MU.jpg"
/// number : "0991338394"
/// lat : 44
/// long : 44
/// vehicle_id : 1
/// created_at : "2024-08-08T13:07:57.000000Z"
/// updated_at : "2024-08-08T13:07:57.000000Z"

GetProfileResponseEntity getProfileRespponseEntityFromJson(String str) => GetProfileResponseEntity.fromJson(json.decode(str));
String getProfileRespponseEntityToJson(GetProfileResponseEntity data) => json.encode(data.toJson());
class GetProfileResponseEntity {
  GetProfileResponseEntity({
      num? id, 
      String? name, 
      String? email, 
      String? gender, 
      String? birthDate, 
      String? image, 
      String? number,
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
    _number = number;
    _lat = lat;
    _long = long;
    _vehicleId = vehicleId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  GetProfileResponseEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _gender = json['gender'];
    _birthDate = json['birth_date'];
    _image = json['image'];
    _number = json['number'];
    _lat = json['lat'];
    _long = json['long'];
    _vehicleId = json['vehicle_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _gender;
  String? _birthDate;
  String? _image;
  String? _number;
  num? _lat;
  num? _long;
  num? _vehicleId;
  String? _createdAt;
  String? _updatedAt;
  GetProfileResponseEntity copyWith({  num? id,
  String? name,
  String? email,
  String? gender,
  String? birthDate,
  String? image,
  String? number,
  double? lat,
  double? long,
  num? vehicleId,
  String? createdAt,
  String? updatedAt,
}) => GetProfileResponseEntity(  id: id ?? _id,
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
  String? get email => _email;
  String? get gender => _gender;
  String? get birthDate => _birthDate;
  String? get image => _image;
  String? get number => _number;
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
    map['number'] = _number;
    map['lat'] = _lat;
    map['long'] = _long;
    map['vehicle_id'] = _vehicleId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}