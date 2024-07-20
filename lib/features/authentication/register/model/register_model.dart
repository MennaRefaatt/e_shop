
class RegisterSuccessResponse{
  bool? _status;
  String? _message;
  RegisterData? _data;

  RegisterSuccessResponse({
    required bool status,
    required String message,
    RegisterData? data
  }){
    _status = status;
    _message = message;
    _data = data;
  }

  RegisterSuccessResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
  }

  RegisterData? get data => _data!;
  bool? get status => _status!;
  String? get message => _message!;
}

class  RegisterData{
  String? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _token;

  RegisterData({
    required String id,
    required  String name,
    required String email,
    required    String phone,
    required  String token,
  }){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _token = token;
  }

  RegisterData.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _token = json['token'];
  }

  String? get id => _id!;
  String? get name => _name!;
  String? get email => _email!;
  String? get phone => _phone!;
  String? get token => _token!;

}