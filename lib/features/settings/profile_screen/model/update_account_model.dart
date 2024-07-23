
class UpdateAccountModel {
bool? _status;
String? _message;
UpdateAccountData? _data;

UpdateAccountModel({
  required bool status,
  required String message,
  required UpdateAccountData data
}) {
  _status = status;
  _message = message;
  _data = data;
}

UpdateAccountModel.fromJson(Map<String, dynamic> json) {
  _status = json['status'];
  _message = json['message'];
  _data = json['data'] != null
      ? UpdateAccountData.fromJson(json['data'])
      : null;
}

bool get status => _status??false;
String get message => _message??'';
UpdateAccountData? get data => _data;

}
class UpdateAccountData {
  int? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _image;
  String? _token;

  UpdateAccountData({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String token
  }) {
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _token = token;
  }

  int? get id => _id?? 0;
  String? get name => _name??'';
  String? get email => _email??'';
  String? get phone => _phone??'';
  String? get image => _image??'';
  String? get token => _token??'';

  UpdateAccountData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _token = json['token'];
  }
}