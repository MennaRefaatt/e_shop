
class TermsAndConditionsModel {
  bool? _status;
  TermsAndConditionsDate? _data;
  TermsAndConditionsModel({required bool status,
    required TermsAndConditionsDate  termsAndConditionsDate}) {
    _status = status;
    _data = termsAndConditionsDate;
  }

  TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null
        ?  TermsAndConditionsDate.fromJson(json['data'])
        : null;
  }


  bool get status => _status?? false;
  TermsAndConditionsDate? get data => _data ;
}

class TermsAndConditionsDate{
  String? _about;
  String? _terms;

  TermsAndConditionsDate({required String about,required String terms}) {
    _about = about;
    _terms = terms;
  }

  String get about => _about??"";
  String get terms => _terms??"";

  TermsAndConditionsDate.fromJson(Map<String, dynamic> json) {
    _about = json['about'];
    _terms = json['terms'];
  }

}