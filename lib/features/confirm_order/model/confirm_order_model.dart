class ConfirmOrderModel{
String?_message;
bool?_status;
ConfirmOrderData?_data;

  ConfirmOrderModel({
    required String message,
    required bool status,
    required ConfirmOrderData data,
  }) {
    _message = message;
    _status = status;
    _data = data;
  }

  ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null
        ?  ConfirmOrderData.fromJson(json['data'])
        : null;
  }

  String get message => _message??'';
  bool get status => _status??false;
  ConfirmOrderData? get data => _data;
}
class ConfirmOrderData{
String? _paymentMethod;
String? _discount;
String? _total;
int? _id;
String? _cost;
String? _vat;

  ConfirmOrderData({
   required String paymentMethod,
    required String discount,
    required String total,
    required int id,
    required String cost,
    required String vat,
  }) {
    _paymentMethod = paymentMethod;
    _discount = discount;
    _total = total;
    _id = id;
    _cost = cost;
    _vat = vat;
  }


  ConfirmOrderData.fromJson(Map<String, dynamic> json) {
    _paymentMethod = json['payment_method'];
    _discount = json['discount'].toString();
    _total = json['total'].toString();
    _id = json['id'];
    _cost = json['cost'].toString();
    _vat = json['vat'].toString();
  }

  String get paymentMethod => _paymentMethod??'';
  String get discount => _discount??'';
  String get total => _total??'';
  int get id => _id??0;
  String get cost => _cost??'';
  String get vat => _vat??'';

set paymentMethod(String value) {
    _paymentMethod = value;
  }
}