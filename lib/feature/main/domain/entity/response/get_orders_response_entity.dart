import 'dart:convert';
/// message : [{"id":3,"order_number":"jyRnLJ4h","status_code":0,"delivery_type":0,"sub_total":100,"total":null,"delivery_fee":null,"client_id":2,"delivery_man_id":null,"address_id":2,"created_at":"2024-09-25T07:00:35.000000Z","updated_at":"2024-09-25T07:00:35.000000Z"}]

GetOrdersResponseEntity getOrdersResponseEntityFromJson(String str) => GetOrdersResponseEntity.fromJson(json.decode(str));
String getOrdersResponseEntityToJson(GetOrdersResponseEntity data) => json.encode(data.toJson());
class GetOrdersResponseEntity {
  GetOrdersResponseEntity({
      List<Orders>? message,}){
    _message = message;
}

  GetOrdersResponseEntity.fromJson(dynamic json) {
    if (json['message'] != null) {
      _message = [];
      json['message'].forEach((v) {
        _message?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? _message;
GetOrdersResponseEntity copyWith({  List<Orders>? message,
}) => GetOrdersResponseEntity(  message: message ?? _message,
);
  List<Orders>? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_message != null) {
      map['message'] = _message?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// order_number : "jyRnLJ4h"
/// status_code : 0
/// delivery_type : 0
/// sub_total : 100
/// total : null
/// delivery_fee : null
/// client_id : 2
/// delivery_man_id : null
/// address_id : 2
/// created_at : "2024-09-25T07:00:35.000000Z"
/// updated_at : "2024-09-25T07:00:35.000000Z"

Orders messageFromJson(String str) => Orders.fromJson(json.decode(str));
String messageToJson(Orders data) => json.encode(data.toJson());
class Orders {
  Orders({
      num? id, 
      String? orderNumber, 
      num? statusCode, 
      num? deliveryType, 
      num? subTotal, 
      dynamic total, 
      dynamic deliveryFee, 
      num? clientId, 
      dynamic deliveryManId, 
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

  Orders.fromJson(dynamic json) {
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
  num? _subTotal;
  dynamic _total;
  dynamic _deliveryFee;
  num? _clientId;
  dynamic _deliveryManId;
  num? _addressId;
  String? _createdAt;
  String? _updatedAt;
Orders copyWith({  num? id,
  String? orderNumber,
  num? statusCode,
  num? deliveryType,
  num? subTotal,
  dynamic total,
  dynamic deliveryFee,
  num? clientId,
  dynamic deliveryManId,
  num? addressId,
  String? createdAt,
  String? updatedAt,
}) => Orders(  id: id ?? _id,
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
  num? get subTotal => _subTotal;
  dynamic get total => _total;
  dynamic get deliveryFee => _deliveryFee;
  num? get clientId => _clientId;
  dynamic get deliveryManId => _deliveryManId;
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