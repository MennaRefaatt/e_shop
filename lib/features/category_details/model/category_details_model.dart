class CategoryDetailsModel {
  bool? _status;
  CategoryDetailsData? _data;

  CategoryDetailsModel({
    required bool status,
    required CategoryDetailsData data,
  }) {
    _status = status;
    _data = data;
  }

  CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null
        ? CategoryDetailsData.fromJson(json['data'])
        : null;
  }

  bool get status => _status??false;
  CategoryDetailsData? get data => _data;
}
class CategoryDetailsData{
  List<CategoryDetailsListData>? _data;

  CategoryDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <CategoryDetailsListData>[];
      json['data'].forEach((v) {
        _data!.add(CategoryDetailsListData.fromJson(v));
      });
    }
  }

  CategoryDetailsData({required List<CategoryDetailsListData> data}) {
    _data = data;
  }

  List<CategoryDetailsListData> get data => _data??[];
}

class CategoryDetailsListData {
  int? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _oldPrice;
  int? _discount;
  String? _image;
  List<String>? _images;
  bool? _inFavorites;
  bool? _inCart;

  CategoryDetailsListData({
    required String name,
    required String image,
    required String price,
    required String oldPrice,
    required int discount,
    required List<String> images,
    required bool inFavorites,
    required bool inCart,
  }) {
    _name = name;
    _image = image;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _images = images;
    _inFavorites = inFavorites;
    _inCart = inCart;
  }


  set inFavorites(bool value) {
    _inFavorites = value;
  }

  set inCart(bool value) {
    _inCart = value;
  }

  int get id => _id??0;
  String get name => _name??"";
  String get description => _description??"";
  String get price => _price??'';
  String get oldPrice => _oldPrice??'';
  int get discount => _discount??0;
  String get image => _image??"";
  bool get inFavorites => _inFavorites??false;
  bool get inCart => _inCart??false;
  List<String> get images => _images??[];

  CategoryDetailsListData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'].toString();
    _oldPrice = json['old_price'].toString();
    _discount = json['discount'];
    _image = json['image'];
    _inFavorites = json['in_favorites'];
    _inCart = json['in_cart'];
    _images = json['images'].cast<String>();
  }

}