import 'dart:convert';
/// id : 2
/// order_number : "t73T64qd"
/// status_code : 3
/// delivery_type : 0
/// sub_total : null
/// total : null
/// delivery_fee : null
/// client_id : 1
/// delivery_man_id : 8
/// address_id : 1
/// created_at : "2024-08-15T07:25:45.000000Z"
/// updated_at : "2024-08-15T07:25:45.000000Z"

DeliveredOrdersResponseEntity deliveredOrdersResponseEntityFromJson(String str) => DeliveredOrdersResponseEntity.fromJson(json.decode(str));
String deliveredOrdersResponseEntityToJson(DeliveredOrdersResponseEntity data) => json.encode(data.toJson());
class DeliveredOrdersResponseEntity {
  DeliveredOrdersResponseEntity({
      num? id, 
      String? orderNumber, 
      num? statusCode, 
      num? deliveryType, 
      dynamic subTotal, 
      dynamic total, 
      dynamic deliveryFee, 
      num? clientId, 
      num? deliveryManId, 
      num? addressId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _orderNumber = orderNumber;
    _statusCode = statusCode;
    _deliveryType = deliveryType;
    _subTotal = subTotal;
    _total = total;
    _deliveryFee = deliveryFee;
    _clientId = clientId;
    _deliveryManId = deliveryManId;
    _addressId = addressId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DeliveredOrdersResponseEntity.fromJson(dynamic json) {
    _id = json['id'];
    _orderNumber = json['order_number'];
    _statusCode = json['status_code'];
    _deliveryType = json['delivery_type'];
    _subTotal = json['sub_total'];
    _total = json['total'];
    _deliveryFee = json['delivery_fee'];
    _clientId = json['client_id'];
    _deliveryManId = json['delivery_man_id'];
    _addressId = json['address_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _orderNumber;
  num? _statusCode;
  num? _deliveryType;
  dynamic _subTotal;
  dynamic _total;
  dynamic _deliveryFee;
  num? _clientId;
  num? _deliveryManId;
  num? _addressId;
  String? _createdAt;
  String? _updatedAt;
DeliveredOrdersResponseEntity copyWith({  num? id,
  String? orderNumber,
  num? statusCode,
  num? deliveryType,
  dynamic subTotal,
  dynamic total,
  dynamic deliveryFee,
  num? clientId,
  num? deliveryManId,
  num? addressId,
  String? createdAt,
  String? updatedAt,
}) => DeliveredOrdersResponseEntity(  id: id ?? _id,
  orderNumber: orderNumber ?? _orderNumber,
  statusCode: statusCode ?? _statusCode,
  deliveryType: deliveryType ?? _deliveryType,
  subTotal: subTotal ?? _subTotal,
  total: total ?? _total,
  deliveryFee: deliveryFee ?? _deliveryFee,
  clientId: clientId ?? _clientId,
  deliveryManId: deliveryManId ?? _deliveryManId,
  addressId: addressId ?? _addressId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get orderNumber => _orderNumber;
  num? get statusCode => _statusCode;
  num? get deliveryType => _deliveryType;
  dynamic get subTotal => _subTotal;
  dynamic get total => _total;
  dynamic get deliveryFee => _deliveryFee;
  num? get clientId => _clientId;
  num? get deliveryManId => _deliveryManId;
  num? get addressId => _addressId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_number'] = _orderNumber;
    map['status_code'] = _statusCode;
    map['delivery_type'] = _deliveryType;
    map['sub_total'] = _subTotal;
    map['total'] = _total;
    map['delivery_fee'] = _deliveryFee;
    map['client_id'] = _clientId;
    map['delivery_man_id'] = _deliveryManId;
    map['address_id'] = _addressId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}