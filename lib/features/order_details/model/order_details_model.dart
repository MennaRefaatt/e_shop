
class OrderDetailsModel {
  bool? _status;
  String? _message;
  OrderDetailsData? _data;

  OrderDetailsModel({
    required bool status,
    required String message,
    required OrderDetailsData data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
  }

  bool get status => _status ?? false;
  String get message => _message ?? "";
  OrderDetailsData? get data => _data;
}

class OrderDetailsData {
  int? _id;
  String? _total;
  String? _date;
  int? _cost;
  double? _vat;
  String? _paymentMethod;
  String? _status;
  OrderAddressDetailsModel? _address;
  List<OrderProductsDetailsModel>? _products;

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _total = json['total'].toString();
    _date = json['date'];
    _cost = json['cost'];
    _vat = json['vat'];
    _paymentMethod = json['payment_method'];
    _status = json['status'];
    _address = json['address'] != null
        ? OrderAddressDetailsModel.fromJson(json['address'])
        : null;
    if (json['products'] != null) {
      _products = <OrderProductsDetailsModel>[];
      json['products'].forEach((v) {
        _products!.add(OrderProductsDetailsModel.fromJson(v));
      });
    }
  }

  OrderDetailsData({
    required int id,
    required String total,
    required String date,
    required int cost,
    required double vat,
    required String paymentMethod,
    required String status,
    required OrderAddressDetailsModel address,
    required List<OrderProductsDetailsModel> products,
  }) {
    _id = id;
    _total = total;
    _date = date;
    _cost = cost;
    _vat = vat;
    _paymentMethod = paymentMethod;
    _status = status;
    _address = address;
    _products = products;
  }

  int get id => _id ?? 0;

  String get total => _total ?? '';

  String get date => _date ?? "";

  int get cost => _cost ?? 0;

  double get vat => _vat ?? 0.0;

  String get paymentMethod => _paymentMethod ?? "";

  String get status => _status ?? "";

  OrderAddressDetailsModel? get address => _address;

  List<OrderProductsDetailsModel> get products => _products ?? [];
}

class OrderAddressDetailsModel {
  String? _name;
  String? _city;
  String? _region;
  String? _details;
  String? _notes;
  int? _id;

  OrderAddressDetailsModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _city = json['city'];
    _region = json['region'];
    _details = json['details'];
    _notes = json['notes'];
    _id = json['id'];
  }

  OrderAddressDetailsModel({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
    required int id,
  }) {
    _name = name;
    _city = city;
    _region = region;
    _details = details;
    _notes = notes;
    _id = id;
  }

  String get name => _name ?? "";

  String get city => _city ?? "";

  String get region => _region ?? "";

  String get details => _details ?? "";

  String get notes => _notes ?? "";

  int get id => _id ?? 0;
}

class OrderProductsDetailsModel {
  String? _name;
  String? _image;
  int? _quantity;
  String? _price;
  int? _id;

  OrderProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _image = json['image'];
    _quantity = json['quantity'];
    _price = json['price'].toString();
    _id = json['id'];
  }

  OrderProductsDetailsModel({
    required String name,
    required String image,
    required int quantity,
    required String price,
    required int id,
  }) {
    _name = name;
    _image = image;
    _quantity = quantity;
    _price = price;
    _id = id;
  }

  String get name => _name ?? "";

  String get image => _image ?? "";

  int get quantity => _quantity ?? 0;

  String get price => _price ?? '';

  int get id => _id ?? 0;
}
