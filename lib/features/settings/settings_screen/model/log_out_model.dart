class LogOutModel {
  bool? _status;
  String? _message;
  LogOutData? _data;

  LogOutModel(
      {required bool status,
      required String message,
      required LogOutData data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  LogOutModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? LogOutData.fromJson(json['data']) : null;
  }

  LogOutData? get data => _data;

  set data(LogOutData? value) {
    _data = value;
  }

  set status(bool value) {
    _status = value;
  }

  bool get status => _status ?? false;
  String get message => _message ?? "";

  set message(String value) {
    _message = value;
  }
}

class LogOutData {
  int? _id;
  String? _token;

  LogOutData({required int id, required String token}) {
    _id = id;
    _token = token;
  }

  LogOutData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _token = json['token'];
  }
  int? get id => _id ?? 0;
  String? get token => _token ?? '';
}
