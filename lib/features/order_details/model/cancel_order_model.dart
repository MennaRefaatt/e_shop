class CancelOrderModel {
  bool? _status;
  String? _message;
  CancelOrderData? _data;

  CancelOrderModel(
      {required bool status,
      required String message,
      required CancelOrderData data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  CancelOrderModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? CancelOrderData.fromJson(json['data']) : null;
  }

  bool get status => _status ?? false;
  String get message => _message ?? '';
  CancelOrderData? get data => _data;
}

class CancelOrderData {
  String? _cost;
  String? _discount;
  String? _paymentMethod;
  String? _total;
  String? _vat;
  int? _id;

  CancelOrderData(
      {required String cost,
      required String discount,
      required String paymentMethod,
      required String total,
      required String vat,
      required int id}) {
    _cost = cost;
    _discount = discount;
    _paymentMethod = paymentMethod;
    _total = total;
    _vat = vat;
    _id = id;
  }
  CancelOrderData.fromJson(Map<String, dynamic> json) {
    _cost = json['cost'].toString();
    _discount = json['discount'].toString();
    _paymentMethod = json['payment_method'];
    _total = json['total'].toString();
    _vat = json['vat'].toString();
    _id = json['id'];
  }

  String get cost => _cost ?? '';
  String get discount => _discount ?? '';
  String get paymentMethod => _paymentMethod ?? '';
  String get total => _total ?? '';
  String get vat => _vat ?? '';
  int get id => _id ?? 0;
}
