class CategoriesModel {
  bool? _status;
  CategoriesData? _data;
  CategoriesModel({required bool status, required CategoriesData? data}) {
    _status = status;
    _data = data;
  }
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = CategoriesData.fromJson(json['data']);
    }
  }

  bool get status => _status ?? false;
  CategoriesData? get data => _data;
}

class CategoriesData {
  List<CategoriesDataList>? _data;
  CategoriesData({required List<CategoriesDataList> data}) {
    _data = data;
  }
  CategoriesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <CategoriesDataList>[];
      json['data'].forEach((v) {
        _data!.add(CategoriesDataList.fromJson(v));
      });
    }
  }
  List<CategoriesDataList> get data => _data ?? [];
}

class CategoriesDataList {
  int? _id;
  String? _name;
  String? _image;
  CategoriesDataList(
      {required int id, required String name, required String image}) {
    _id = id;
    _name = name;
    _image = image;
  }
  int get id => _id ?? 0;
  String get name => _name ?? "";
  String get image => _image ?? "";
  CategoriesDataList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
}
