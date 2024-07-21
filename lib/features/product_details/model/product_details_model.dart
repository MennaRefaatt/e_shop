class ProductDetailsModel {
  bool? _status;
  ProductDetailsData? _data;


  ProductDetailsModel({
    required bool status,
    required ProductDetailsData data,
  }) {
    _status = status;
    _data = data;
  }


  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null
        ? ProductDetailsData.fromJson(json['data'])
        : null;
  }


  bool get status => _status??false;
  ProductDetailsData? get data => _data;

}

class ProductDetailsData {
  int? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _oldPrice;
  String? _discount;
  String? _image;
  List<String>? _images;
  bool? _inFavorites;
  bool? _inCart;

  ProductDetailsData({
    required String name,
    required String image,
    required String price,
    required String oldPrice,
    required String discount,
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
  String get price => _price??"";
  String get oldPrice => _oldPrice??'';
  String get discount => _discount??'';
  String get image => _image??"";
  List<String> get images => _images??[];
  bool get inFavorites => _inFavorites??false;
  bool get inCart => _inCart??false;

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'].toString();
    _oldPrice = json['old_price'].toString();
    _discount = json['discount'].toString();
    _image = json['image'];
    _images = json['images'].cast<String>();
    _inFavorites = json['in_favorites'];
    _inCart = json['in_cart'];
  }
}
