
class AddressModel {
  bool? _status;
  String? _message;
  List<AddressDataListModel>? _data;
  AddressData? _addressData;


  AddressModel(
      {required bool status,
      required String message,
      required List<AddressDataListModel> data,
      required AddressData addressData}) {
    _status = status;
    _message = message;
    _data = data;
    _addressData = addressData;
  }


  AddressModel.fromJson(Map<String, dynamic> json) {
    _status = json["status"];
    _message = json["message"];
   //  if (json["data"] != null) {
   //   _data = [];
   //    json["data"].forEach((v) {
   //      _data?.add(AddressDataListModel.fromJson(v));
   //    });
   // }
    _addressData = json["data"] != null
        ? AddressData.fromJson(json["data"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = _status;
    data["message"] = _message;
    if (_data != null) {
      data["data"] = _data?.map((v) => v.toJson()).toList();
    }
    if (_addressData != null) {
      data["data"] = _addressData?.toJson();
    }
    return data;
  }


  bool get status => _status??false;
  String get message => _message??'';
  List<AddressDataListModel> get data => _data??[];
  AddressData? get addressData => _addressData;



}
class AddressData{
  List<AddressDataListModel>? _data;

  AddressData({required List<AddressDataListModel> data}) {
    _data = data;
  }

  AddressData.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(AddressDataListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_data != null) {
      data["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<AddressDataListModel> get data => _data??[];

  set data(List<AddressDataListModel> value) => _data = value;
}

class AddressDataListModel {
  String? _name;
  String? _city;
  String? _region;
  String? _details;
  String? _notes;
  String? _latitude;
  String? _longitude;
  int? _id;

  AddressDataListModel(
      {required String name,
      required String city,
      required String region,
      required String details,
      required String notes,
      required String latitude,
      required String longitude,
      required int id}) {
    _name = name;
    _city = city;
    _region = region;
    _details = details;
    _notes = notes;
    _latitude = latitude;
    _longitude = longitude;
    _id = id;
  }

  AddressDataListModel.fromJson(Map<String, dynamic>  json) {
    _name = json["name"];
    _city = json["city"];
    _region = json["region"];
    _details = json["details"];
    _notes = json["notes"];
    _latitude = json["latitude"].toString();
    _longitude = json["longitude"].toString();
    _id = json["id"];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = _name;
    data["city"] = _city;
    data["region"] = _region;
    data["details"] = _details;
    data["notes"] = _notes;
    data["latitude"] = _latitude.toString();
    data["longitude"] = _longitude.toString();
    data["id"] = _id;
    return data;
  }

  set name(String value) {
    _name = value;
  }

  String get name => _name??'';
  String get city => _city??'';
  String get region => _region??'';
  String get details => _details??'';
  String get notes => _notes??'';
  String get latitude => _latitude??'';
  String get longitude => _longitude??'';
  int get id => _id??0;

  set city(String value) {
    _city = value;
  }

  set region(String value) {
    _region = value;
  }

  set details(String value) {
    _details = value;
  }

  set notes(String value) {
    _notes = value;
  }

  set latitude(String value) {
    _latitude = value;
  }

  set longitude(String value) {
    _longitude = value;
  }

  set id(int value) {
    _id = value;
  }
}
