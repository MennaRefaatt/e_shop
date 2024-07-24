class LoginSuccessResponse{
  bool? _status;
  String? _message;
  LoginData? _data;

  LoginSuccessResponse({
    required bool status,
    required String message,
     required LoginData data
  }){
    _status = status;
    _message = message;
    _data = data;
  }

  LoginSuccessResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  LoginData? get data => _data;
  bool get status => _status??false;
  String get message => _message??'';
}

class  LoginData{
  String? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _token;

  LoginData({
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

  LoginData.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _token = json['token'];
  }

  String get id => _id??"";
  String get name => _name??'';
  String get email => _email??'';
  String get phone => _phone??'';
  String get token => _token??'';

}