

class OrdersModel {
  bool? _status;
  String? _message;
  OrderData? _data;

  OrdersModel({
    required bool status,
    required String message,
    required OrderData data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  bool get status => _status ?? false;
  String get message => _message ?? "";
  OrderData get data => _data ?? OrderData(data: []);

  OrdersModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? OrderData.fromJson(json['data']) : null;
  }
}

class OrderData {
  List<OrderDataList>? _data;

  OrderData({
    required List<OrderDataList> data,
  }) {
    _data = data;
  }

  List<OrderDataList> get data => _data ?? [];

  OrderData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <OrderDataList>[];
      json['data'].forEach((v) {
        _data!.add(OrderDataList.fromJson(v));
      });
    }
  }
}

class OrderDataList {
  int? _id;
  String? _total;
  String? _date;
  String? _status;

  OrderDataList({
    required int id,
    required String total,
    required String date,
    required String status,
  }) {
    _id = id;
    _total = total;
    _date = date;
    _status = status;
  }

  int get id => _id ?? 0;
  String get total => _total ?? '';
  String get date => _date ?? "";
  String get status => _status ?? "";

  OrderDataList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _total = json['total'].toString();
    _date = json['date'];
    _status = json['status'];

  }
}
