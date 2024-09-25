import 'dart:convert';
/// vehicle_id : 2

GetOrdersRequestEntity getOrdersRequestEntityFromJson(String str) => GetOrdersRequestEntity.fromJson(json.decode(str));
String getOrdersRequestEntityToJson(GetOrdersRequestEntity data) => json.encode(data.toJson());
class GetOrdersRequestEntity {
  GetOrdersRequestEntity({
      String? vehicleId,}){
    _vehicleId = vehicleId;
}

  GetOrdersRequestEntity.fromJson(dynamic json) {
    _vehicleId = json['vehicle_id'];
  }
  String? _vehicleId;
GetOrdersRequestEntity copyWith({  String? vehicleId,
}) => GetOrdersRequestEntity(  vehicleId: vehicleId ?? _vehicleId,
);
  String? get vehicleId => _vehicleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicle_id'] = _vehicleId;
    return map;
  }

}