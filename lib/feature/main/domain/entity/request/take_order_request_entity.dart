import 'dart:convert';
/// id : 5
/// delivery_man_id : 1
/// status_code : 2

TakeOrderRequestEntity takeOrderRequestEntityFromJson(String str) => TakeOrderRequestEntity.fromJson(json.decode(str));
String takeOrderRequestEntityToJson(TakeOrderRequestEntity data) => json.encode(data.toJson());
class TakeOrderRequestEntity {
  TakeOrderRequestEntity({
      String? id,
    String? deliveryManId,
    String? statusCode,}){
    _id = id;
    _deliveryManId = deliveryManId;
    _statusCode = statusCode;
}

  TakeOrderRequestEntity.fromJson(dynamic json) {
    _id = json['id'];
    _deliveryManId = json['delivery_man_id'];
    _statusCode = json['status_code'];
  }
  String? _id;
  String? _deliveryManId;
  String? _statusCode;
TakeOrderRequestEntity copyWith({  String? id,
  String? deliveryManId,
  String? statusCode,
}) => TakeOrderRequestEntity(  id: id ?? _id,
  deliveryManId: deliveryManId ?? _deliveryManId,
  statusCode: statusCode ?? _statusCode,
);
  String? get id => _id;
  String? get deliveryManId => _deliveryManId;
  String? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['delivery_man_id'] = _deliveryManId;
    map['status_code'] = _statusCode;
    return map;
  }

}