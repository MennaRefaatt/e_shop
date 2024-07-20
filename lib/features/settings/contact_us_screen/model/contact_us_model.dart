class ContactUsModel {
  bool? _status;
  ContactUsData? _data;
  ContactUsModel({required bool status, required ContactUsData? data}) {
    _status = status;
    _data = data;
  }
  ContactUsModel.fromJson(Map<dynamic, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = ContactUsData.fromJson(json['data']);
    }
  }

  bool get status => _status ?? false;
  ContactUsData? get data => _data;
}
class ContactUsData {
  List<ContactUsDataList>? _data;
  ContactUsData({required List<ContactUsDataList> data}) {
    _data = data;
  }
  ContactUsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <ContactUsDataList>[];
      json['data'].forEach((v) {
        _data!.add(ContactUsDataList.fromJson(v));
      });
    }
  }
  List<ContactUsDataList> get data => _data ?? [];
}


class ContactUsDataList {
  int? _id;
  String? _value;
  int? _type;
  String? _image;
  ContactUsDataList(
      {required int id, required String value, required String image, required int type}) {
    _id = id;
    _image = image;
    _type = type;
    _value = value;
  }
  int get id => _id  ?? 0;
  String get image => _image ?? "" ;
  int get type => _type ?? 0;
  String get value => _value ?? "";
  ContactUsDataList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _type = json['type'];
    _value = json['value'];
  }
}
