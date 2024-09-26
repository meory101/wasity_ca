import 'dart:convert';
/// result : [{"orderDetails":{"order":{"id":3,"order_number":"jyRnLJ4h","status_code":0,"delivery_type":0,"sub_total":100,"total":null,"delivery_fee":null,"client_id":2,"delivery_man_id":null,"address_id":2,"created_at":"2024-09-25T07:00:35.000000Z","updated_at":"2024-09-25T07:00:35.000000Z"},"products":[{"product":{"id":3,"name":"koooooo","desc":"kso sksksks skskks jkssssssssssssssss","image":"vdHzcTOMu7HuvKJZisdFvERuOjbDF3lAvtuyA5xW.jpg","price":100,"size_type":1,"count":91,"sub_branch_id":2,"brand_id":1,"sub_category_id":1,"created_at":"2024-09-25T06:41:50.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"},"branch":{"id":2,"name":"sub branch","image":"E6TxHuStefjViZTuHlVceygacUyN29IbVRecjNB3.jpg","lat":22,"long":22,"active_status":1,"main_branch_id":1,"manager_id":1,"created_at":"2024-09-25T06:39:54.000000Z","updated_at":"2024-09-25T06:39:54.000000Z"}}],"client":{"id":2,"name":null,"email":null,"gender":null,"birth_date":null,"points":1028,"number":"099","image":null,"created_at":"2024-09-25T06:33:04.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"},"address":{"id":2,"name":"location","lat":33.6577555,"long":33.8399333,"client_id":2,"created_at":"2024-09-25T07:00:14.000000Z","updated_at":"2024-09-25T07:00:14.000000Z"}}}]

GetOrdersResponseEntity getOrdersResponseEntityFromJson(String str) => GetOrdersResponseEntity.fromJson(json.decode(str));
String getOrdersResponseEntityToJson(GetOrdersResponseEntity data) => json.encode(data.toJson());
class GetOrdersResponseEntity {
  GetOrdersResponseEntity({
      List<Result>? result,}){
    _result = result;
}

  GetOrdersResponseEntity.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  List<Result>? _result;
GetOrdersResponseEntity copyWith({  List<Result>? result,
}) => GetOrdersResponseEntity(  result: result ?? _result,
);
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// orderDetails : {"order":{"id":3,"order_number":"jyRnLJ4h","status_code":0,"delivery_type":0,"sub_total":100,"total":null,"delivery_fee":null,"client_id":2,"delivery_man_id":null,"address_id":2,"created_at":"2024-09-25T07:00:35.000000Z","updated_at":"2024-09-25T07:00:35.000000Z"},"products":[{"product":{"id":3,"name":"koooooo","desc":"kso sksksks skskks jkssssssssssssssss","image":"vdHzcTOMu7HuvKJZisdFvERuOjbDF3lAvtuyA5xW.jpg","price":100,"size_type":1,"count":91,"sub_branch_id":2,"brand_id":1,"sub_category_id":1,"created_at":"2024-09-25T06:41:50.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"},"branch":{"id":2,"name":"sub branch","image":"E6TxHuStefjViZTuHlVceygacUyN29IbVRecjNB3.jpg","lat":22,"long":22,"active_status":1,"main_branch_id":1,"manager_id":1,"created_at":"2024-09-25T06:39:54.000000Z","updated_at":"2024-09-25T06:39:54.000000Z"}}],"client":{"id":2,"name":null,"email":null,"gender":null,"birth_date":null,"points":1028,"number":"099","image":null,"created_at":"2024-09-25T06:33:04.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"},"address":{"id":2,"name":"location","lat":33.6577555,"long":33.8399333,"client_id":2,"created_at":"2024-09-25T07:00:14.000000Z","updated_at":"2024-09-25T07:00:14.000000Z"}}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      OrderDetails? orderDetails,}){
    _orderDetails = orderDetails;
}

  Result.fromJson(dynamic json) {
    _orderDetails = json['orderDetails'] != null ? OrderDetails.fromJson(json['orderDetails']) : null;
  }
  OrderDetails? _orderDetails;
Result copyWith({  OrderDetails? orderDetails,
}) => Result(  orderDetails: orderDetails ?? _orderDetails,
);
  OrderDetails? get orderDetails => _orderDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orderDetails != null) {
      map['orderDetails'] = _orderDetails?.toJson();
    }
    return map;
  }

}

/// order : {"id":3,"order_number":"jyRnLJ4h","status_code":0,"delivery_type":0,"sub_total":100,"total":null,"delivery_fee":null,"client_id":2,"delivery_man_id":null,"address_id":2,"created_at":"2024-09-25T07:00:35.000000Z","updated_at":"2024-09-25T07:00:35.000000Z"}
/// products : [{"product":{"id":3,"name":"koooooo","desc":"kso sksksks skskks jkssssssssssssssss","image":"vdHzcTOMu7HuvKJZisdFvERuOjbDF3lAvtuyA5xW.jpg","price":100,"size_type":1,"count":91,"sub_branch_id":2,"brand_id":1,"sub_category_id":1,"created_at":"2024-09-25T06:41:50.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"},"branch":{"id":2,"name":"sub branch","image":"E6TxHuStefjViZTuHlVceygacUyN29IbVRecjNB3.jpg","lat":22,"long":22,"active_status":1,"main_branch_id":1,"manager_id":1,"created_at":"2024-09-25T06:39:54.000000Z","updated_at":"2024-09-25T06:39:54.000000Z"}}]
/// client : {"id":2,"name":null,"email":null,"gender":null,"birth_date":null,"points":1028,"number":"099","image":null,"created_at":"2024-09-25T06:33:04.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"}
/// address : {"id":2,"name":"location","lat":33.6577555,"long":33.8399333,"client_id":2,"created_at":"2024-09-25T07:00:14.000000Z","updated_at":"2024-09-25T07:00:14.000000Z"}

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));
String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());
class OrderDetails {
  OrderDetails({
      Order? order, 
      List<Products>? products, 
      Client? client, 
      Address? address,}){
    _order = order;
    _products = products;
    _client = client;
    _address = address;
}

  OrderDetails.fromJson(dynamic json) {
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  Order? _order;
  List<Products>? _products;
  Client? _client;
  Address? _address;
OrderDetails copyWith({  Order? order,
  List<Products>? products,
  Client? client,
  Address? address,
}) => OrderDetails(  order: order ?? _order,
  products: products ?? _products,
  client: client ?? _client,
  address: address ?? _address,
);
  Order? get order => _order;
  List<Products>? get products => _products;
  Client? get client => _client;
  Address? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    return map;
  }

}

/// id : 2
/// name : "location"
/// lat : 33.6577555
/// long : 33.8399333
/// client_id : 2
/// created_at : "2024-09-25T07:00:14.000000Z"
/// updated_at : "2024-09-25T07:00:14.000000Z"

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      num? id, 
      String? name, 
      num? lat, 
      num? long, 
      num? clientId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _lat = lat;
    _long = long;
    _clientId = clientId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Address.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _lat = json['lat'];
    _long = json['long'];
    _clientId = json['client_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _lat;
  num? _long;
  num? _clientId;
  String? _createdAt;
  String? _updatedAt;
Address copyWith({  num? id,
  String? name,
  num? lat,
  num? long,
  num? clientId,
  String? createdAt,
  String? updatedAt,
}) => Address(  id: id ?? _id,
  name: name ?? _name,
  lat: lat ?? _lat,
  long: long ?? _long,
  clientId: clientId ?? _clientId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get lat => _lat;
  num? get long => _long;
  num? get clientId => _clientId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['lat'] = _lat;
    map['long'] = _long;
    map['client_id'] = _clientId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 2
/// name : null
/// email : null
/// gender : null
/// birth_date : null
/// points : 1028
/// number : "099"
/// image : null
/// created_at : "2024-09-25T06:33:04.000000Z"
/// updated_at : "2024-09-25T07:02:33.000000Z"

Client clientFromJson(String str) => Client.fromJson(json.decode(str));
String clientToJson(Client data) => json.encode(data.toJson());
class Client {
  Client({
      num? id, 
      dynamic name, 
      dynamic email, 
      dynamic gender, 
      dynamic birthDate, 
      num? points, 
      String? number, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _gender = gender;
    _birthDate = birthDate;
    _points = points;
    _number = number;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Client.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _gender = json['gender'];
    _birthDate = json['birth_date'];
    _points = json['points'];
    _number = json['number'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  dynamic _name;
  dynamic _email;
  dynamic _gender;
  dynamic _birthDate;
  num? _points;
  String? _number;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
Client copyWith({  num? id,
  dynamic name,
  dynamic email,
  dynamic gender,
  dynamic birthDate,
  num? points,
  String? number,
  dynamic image,
  String? createdAt,
  String? updatedAt,
}) => Client(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  gender: gender ?? _gender,
  birthDate: birthDate ?? _birthDate,
  points: points ?? _points,
  number: number ?? _number,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  dynamic get name => _name;
  dynamic get email => _email;
  dynamic get gender => _gender;
  dynamic get birthDate => _birthDate;
  num? get points => _points;
  String? get number => _number;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['gender'] = _gender;
    map['birth_date'] = _birthDate;
    map['points'] = _points;
    map['number'] = _number;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// product : {"id":3,"name":"koooooo","desc":"kso sksksks skskks jkssssssssssssssss","image":"vdHzcTOMu7HuvKJZisdFvERuOjbDF3lAvtuyA5xW.jpg","price":100,"size_type":1,"count":91,"sub_branch_id":2,"brand_id":1,"sub_category_id":1,"created_at":"2024-09-25T06:41:50.000000Z","updated_at":"2024-09-25T07:02:33.000000Z"}
/// branch : {"id":2,"name":"sub branch","image":"E6TxHuStefjViZTuHlVceygacUyN29IbVRecjNB3.jpg","lat":22,"long":22,"active_status":1,"main_branch_id":1,"manager_id":1,"created_at":"2024-09-25T06:39:54.000000Z","updated_at":"2024-09-25T06:39:54.000000Z"}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      Product? product, 
      Branch? branch,}){
    _product = product;
    _branch = branch;
}

  Products.fromJson(dynamic json) {
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
  }
  Product? _product;
  Branch? _branch;
Products copyWith({  Product? product,
  Branch? branch,
}) => Products(  product: product ?? _product,
  branch: branch ?? _branch,
);
  Product? get product => _product;
  Branch? get branch => _branch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_branch != null) {
      map['branch'] = _branch?.toJson();
    }
    return map;
  }

}

/// id : 2
/// name : "sub branch"
/// image : "E6TxHuStefjViZTuHlVceygacUyN29IbVRecjNB3.jpg"
/// lat : 22
/// long : 22
/// active_status : 1
/// main_branch_id : 1
/// manager_id : 1
/// created_at : "2024-09-25T06:39:54.000000Z"
/// updated_at : "2024-09-25T06:39:54.000000Z"

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));
String branchToJson(Branch data) => json.encode(data.toJson());
class Branch {
  Branch({
      num? id, 
      String? name, 
      String? image, 
      num? lat, 
      num? long, 
      num? activeStatus, 
      num? mainBranchId, 
      num? managerId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _lat = lat;
    _long = long;
    _activeStatus = activeStatus;
    _mainBranchId = mainBranchId;
    _managerId = managerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Branch.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _lat = json['lat'];
    _long = json['long'];
    _activeStatus = json['active_status'];
    _mainBranchId = json['main_branch_id'];
    _managerId = json['manager_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _image;
  num? _lat;
  num? _long;
  num? _activeStatus;
  num? _mainBranchId;
  num? _managerId;
  String? _createdAt;
  String? _updatedAt;
Branch copyWith({  num? id,
  String? name,
  String? image,
  num? lat,
  num? long,
  num? activeStatus,
  num? mainBranchId,
  num? managerId,
  String? createdAt,
  String? updatedAt,
}) => Branch(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  lat: lat ?? _lat,
  long: long ?? _long,
  activeStatus: activeStatus ?? _activeStatus,
  mainBranchId: mainBranchId ?? _mainBranchId,
  managerId: managerId ?? _managerId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  num? get lat => _lat;
  num? get long => _long;
  num? get activeStatus => _activeStatus;
  num? get mainBranchId => _mainBranchId;
  num? get managerId => _managerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['lat'] = _lat;
    map['long'] = _long;
    map['active_status'] = _activeStatus;
    map['main_branch_id'] = _mainBranchId;
    map['manager_id'] = _managerId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 3
/// name : "koooooo"
/// desc : "kso sksksks skskks jkssssssssssssssss"
/// image : "vdHzcTOMu7HuvKJZisdFvERuOjbDF3lAvtuyA5xW.jpg"
/// price : 100
/// size_type : 1
/// count : 91
/// sub_branch_id : 2
/// brand_id : 1
/// sub_category_id : 1
/// created_at : "2024-09-25T06:41:50.000000Z"
/// updated_at : "2024-09-25T07:02:33.000000Z"

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      num? id, 
      String? name, 
      String? desc, 
      String? image, 
      num? price, 
      num? sizeType, 
      num? count, 
      num? subBranchId, 
      num? brandId, 
      num? subCategoryId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _desc = desc;
    _image = image;
    _price = price;
    _sizeType = sizeType;
    _count = count;
    _subBranchId = subBranchId;
    _brandId = brandId;
    _subCategoryId = subCategoryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _image = json['image'];
    _price = json['price'];
    _sizeType = json['size_type'];
    _count = json['count'];
    _subBranchId = json['sub_branch_id'];
    _brandId = json['brand_id'];
    _subCategoryId = json['sub_category_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _desc;
  String? _image;
  num? _price;
  num? _sizeType;
  num? _count;
  num? _subBranchId;
  num? _brandId;
  num? _subCategoryId;
  String? _createdAt;
  String? _updatedAt;
Product copyWith({  num? id,
  String? name,
  String? desc,
  String? image,
  num? price,
  num? sizeType,
  num? count,
  num? subBranchId,
  num? brandId,
  num? subCategoryId,
  String? createdAt,
  String? updatedAt,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  desc: desc ?? _desc,
  image: image ?? _image,
  price: price ?? _price,
  sizeType: sizeType ?? _sizeType,
  count: count ?? _count,
  subBranchId: subBranchId ?? _subBranchId,
  brandId: brandId ?? _brandId,
  subCategoryId: subCategoryId ?? _subCategoryId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get desc => _desc;
  String? get image => _image;
  num? get price => _price;
  num? get sizeType => _sizeType;
  num? get count => _count;
  num? get subBranchId => _subBranchId;
  num? get brandId => _brandId;
  num? get subCategoryId => _subCategoryId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['desc'] = _desc;
    map['image'] = _image;
    map['price'] = _price;
    map['size_type'] = _sizeType;
    map['count'] = _count;
    map['sub_branch_id'] = _subBranchId;
    map['brand_id'] = _brandId;
    map['sub_category_id'] = _subCategoryId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
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

  Order.fromJson(dynamic json) {
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
Order copyWith({  num? id,
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
}) => Order(  id: id ?? _id,
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