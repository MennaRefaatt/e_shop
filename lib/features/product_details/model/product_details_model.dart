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
  int? _price;
  int? _oldPrice;
  int? _discount;
  String? _image;
  List<String>? _images;
  bool? _inFavorites;
  bool? _inCart;

  ProductDetailsData({
    required String name,
    required String image,
    required int price,
    required int oldPrice,
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
  int get price => _price??0;
  int get oldPrice => _oldPrice??0;
  int get discount => _discount??0;
  String get image => _image??"";
  List<String> get images => _images??[];
  bool get inFavorites => _inFavorites??false;
  bool get inCart => _inCart??false;

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _oldPrice = json['old_price'];
    _discount = json['discount'];
    _image = json['image'];
    _images = json['images'].cast<String>();
    _inFavorites = json['in_favorites'];
    _inCart = json['in_cart'];
  }
}
