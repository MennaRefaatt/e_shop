
import 'package:bloc/bloc.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/shared_preferences/my_shared_keys.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitialState()) ;
  static dynamic language;

  void changeLanguage() async {
    emit(ChangeLanguageState());
  }

  void changeLanguageToEn() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "en");
    emit(ChangeLanguageState());
  }

  void changeLanguageToAr() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "ar");
    emit(ChangeLanguageState());
  }
}