class SearchModel {
  String? _message;
  bool? _status;
  SearchData? _data;

  SearchModel(
      {required String message, required bool status, required SearchData data}) {
    _message = message;
    _status = status;
    _data = data;
  }

  SearchModel.fromMap(Map<String, dynamic> map){
    _message = map['message'];
    _status = map['status'];
    _data = map['data'] != null ? SearchData.fromMap(map['data']) : null;
  }

  String get message => _message??'';
  bool get status => _status??false;
  SearchData? get data => _data;
}

class SearchData {
  List<SearchDataList>? _searchDataList;
  SearchData({required List<SearchDataList>? searchDataList}){
    _searchDataList = searchDataList;
  }

  SearchData.fromMap(Map<String, dynamic> map){
    if(map['data'] != null){
      _searchDataList = <SearchDataList>[];
      map['data'].forEach((element){
        _searchDataList?.add(SearchDataList.fromMap(element));
      });
    }
  }
  List<SearchDataList> get searchDataList => _searchDataList??[];

}
class SearchDataList{
  int? _id;
  String? _name;
  String? _image;
  String? _price;
  bool? _inFavourite;
  bool? _inCart;
  String? _description;

  SearchDataList.fromMap(Map<String, dynamic> map){
    _id = map['id'];
    _name = map['name'];
    _image = map['image'];
    _price = map['price'].toString();
    _inFavourite = map['inFavourite'];
    _inCart = map['inCart'];
    _description = map['description'];
  }


  int get id => _id??0;
  String get name => _name??'';
  String get image => _image??'';
  String get price => _price??'';
  bool get inFavourite => _inFavourite??false;
  bool get inCart => _inCart??false;
  String get description => _description??'';

}