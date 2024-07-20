
class HomeModel{
  bool? _status;
  HomeData? _data;

  HomeModel({required bool status, required HomeData data,}){
  _status = status;
  _data = data;
}

  HomeModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
  bool? get status => _status;
  HomeData? get data => _data;
}

class HomeData{
  List<HomeBanners>? _banners;
  List<HomeProducts>? _products;

  HomeData({required List<HomeBanners> banners, required List<HomeProducts> products}){
    _banners = banners;
    _products = products;
  }

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      _banners = <HomeBanners>[];
      json['banners'].forEach((v) {
        _banners!.add(HomeBanners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = <HomeProducts>[];
      json['products'].forEach((v) {
        _products!.add(HomeProducts.fromJson(v));
      });
    }
  }
  List<HomeBanners> get banners => _banners ?? [];
  List<HomeProducts> get products => _products??  [];
}
class HomeBanners{
int? _id;
String? _image;

    HomeBanners({required int id, required String image}){
      _id = id;
      _image = image;
    }

  HomeBanners.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
  }

  String get image => _image ?? '';

  int get id => _id ?? 0;


}
class HomeProducts{
   int? _id;
   String? _price;
   String? _image;
   String? _name;
   bool? _isFav;
   String? _oldPrice;
   String? _discount;


   String get oldPrice => _oldPrice ??"";

  HomeProducts({
   required int id,
     required String price,
     required  String image,
     required String name,
     required  bool isFav,
     String? oldPrice,
     String? discount,
}){
    _id = id;
    _price = price;
    _image = image;
    _name = name;
    _isFav = isFav;
    _oldPrice = oldPrice;
    _discount = discount;
   }

  int get id => _id ?? 0;

   String get price => _price ?? "";

   String get image => _image ?? '';

   String get name => _name  ?? "";

   bool get isFav => _isFav ?? false;


   set isFav(bool value) {
    _isFav = value;
  }

  HomeProducts.fromJson(Map<String, dynamic> json) {
     _id = json['id'];
     _price = json['price'].toString();
     _image = json['image'];
     _name = json['name'];
     _isFav = json['in_favorites'];
     _oldPrice = json['old_price'].toString();
     _discount = json['discount'].toString();
   }

   String get discount => _discount??"";


}