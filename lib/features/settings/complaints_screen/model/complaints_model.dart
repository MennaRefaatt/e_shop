
class ComplaintsModel {

  bool?_status;
  String?_message;
  List<ComplaintsDataList>?_data;

ComplaintsModel({required bool status,required String message,required List<ComplaintsDataList> data}) {
  _status = status;
  _message = message;
  _data = data;
}

  ComplaintsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <ComplaintsDataList>[];
      json['data'].forEach((v) {
        _data!.add(new ComplaintsDataList.fromJson(v));
      });
    }
  }

  bool get status => _status??false;
  String get message => _message??'';
  List<ComplaintsDataList> get data => _data??[];

}
class ComplaintsDataList {
  String? _name;
  String? _email;
  String? _message;
String?_phone;
int?_id;
  ComplaintsDataList.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _message = json['message'];
    _phone = json['phone'];
    _id = json['id'];
  }

  ComplaintsDataList(
      {required String name,
      required String email,
      required String message,
      required String phone,
      required int id}) {
    _name = name;
    _email = email;
    _message = message;
    _phone = phone;
    _id = id;
  }

  int get id => _id??0;
  String get name => _name??'';
  String get email => _email??'';
  String get message => _message??'';
  String get phone => _phone??'';
}