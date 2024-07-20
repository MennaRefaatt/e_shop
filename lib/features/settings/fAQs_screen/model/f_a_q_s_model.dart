class FAQsModel {
  bool? _status;
  FAQsData? _data;
  FAQsModel({required bool status, required FAQsData? data}) {
    _status = status;
    _data = data;
  }
  FAQsModel.fromJson(Map<dynamic, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = FAQsData.fromJson(json['data']);
    }
  }

  bool get status => _status ?? false;
  FAQsData? get data => _data;
}
class FAQsData {
  List<FAQsDataList>? _data;
  FAQsData({required List<FAQsDataList> data}) {
    _data = data;
  }
  FAQsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <FAQsDataList>[];
      json['data'].forEach((v) {
        _data!.add(FAQsDataList.fromJson(v));
      });
    }
  }
  List<FAQsDataList> get data => _data ?? [];
}


class FAQsDataList {
  int? _id;
  String? _question;
  String? _answer;
  FAQsDataList({required int id, required String question, required String answer}) {
    _id = id;
    _question = question;
    _answer = answer;
  }
  int get id => _id ?? 0;
  String get question => _question ?? "" ;
  String get answer => _answer ?? "" ;
  FAQsDataList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _question = json['question'];
    _answer = json['answer'];
  }
}

