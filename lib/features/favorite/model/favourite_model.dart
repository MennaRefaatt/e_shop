class FavouriteModel {
  String? _message;
  bool? _status;
  FavouriteData? _data;
  FavouriteModel(
      {required bool status,
      required FavouriteData? data,
      required String message}) {
    _status = status;
    _data = data;
    _message = message;
  }
  FavouriteModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = FavouriteData.fromJson(json['data']);
  }

  String get message => _message ?? '';
  bool get status => _status ?? false;
  FavouriteData? get data => _data;
}

class FavouriteData {
  List<FavouriteDataList>? _data;
  FavouriteData({required List<FavouriteDataList> data, }) {
    _data = data;

  }

  FavouriteData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <FavouriteDataList>[];
      json['data'].forEach((v) {
        _data!.add(FavouriteDataList.fromJson(v));
      });
    }
  }
  List<FavouriteDataList> get data => _data ?? [];
}

class FavouriteDataList {
  int? _id;
  FavouriteProduct? _product;
  FavouriteDataList({
    required int id,
    required FavouriteProduct product,
  }) {
    id = id;
    product = product;
  }

  FavouriteDataList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _product = FavouriteProduct.fromJson(json['product']);
  }

  FavouriteProduct? get product => _product;
  int get id => _id ?? 0;
}

class FavouriteProduct {
  int? _id;
  String? _name;
  String? _price;
  String? _oldPrice;
  int? _discount;
  String? _image;

  FavouriteProduct(
      {required int id,
      required String name,
      required String image,
      required String price,
      required String oldPrice,
      required int discount,
     }) {
    _name = name;
    _id = id;
    _image = image;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
  }

  FavouriteProduct.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'].toString();
    _oldPrice = json['old_price'].toString();
    _discount = json['discount'];
    _image = json['image'];
  }

  int get id => _id ?? 0;
  String get name => _name ?? "";
  String get price => _price ?? '';
  String get oldPrice => _oldPrice ?? '';
  int get discount => _discount ?? 0;
  String get image => _image ?? "";
}
