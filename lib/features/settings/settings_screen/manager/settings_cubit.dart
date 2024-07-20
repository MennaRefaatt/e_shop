import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/features/settings/settings_screen/model/log_out_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/utils/safe_print.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void logOut() async{
    emit(LogOutLoading());
    await MyDio.postData(endPoint: EndPoints.logout).then((response) {
      response.fold((error) {
        safePrint("Error: $error");
        emit(LogOutError( error.toString()));
      }, (data) {
        safePrint("Response Data: $data");
        // Print the response for debugging
        if (data['status'] == false) {
          safePrint("Logout failed with message: ${data['message']}");
          emit(LogOutError( "ERROR"));
        } else {
          try {
            LogOutModel logOutModel = LogOutModel.fromJson(data);
            safePrint(logOutModel.data);
            safePrint("Logout successful: ${logOutModel.data}");
            emit(LogOutSuccess( logOutModel: logOutModel));
          } catch (e) {
            safePrint("==>$e");
            emit(LogOutError( "Parsing error: $e"));
          }
        }
      });
    });
  }
}
