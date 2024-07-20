import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/endpoints.dart';
import '../../../../../../../core/api/my_dio.dart';
import '../../../../../../../core/utils/safe_print.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future <void> changePassword() async {
    emit(ChangePasswordLoading());
    await MyDio.postData(endPoint: EndPoints.changePassword,
        data: {
          "current_password": currentPassController.text,
          "new_password": newPassController.text,
          "confirm_password": confirmPasswordController.text,

        }).then((response) {
      response.fold((error) {
        safePrint("Error: $error");
        emit(ChangePasswordError(  error.toString()));
      },
              (isRight) async {
        safePrint("Response Data: $isRight");
        // Print the response for debugging
        if (isRight['status'] == false) {
          safePrint("change password failed with message: ${isRight['message']}");
          emit(ChangePasswordError(  "ERROR"));
        } else {
          try {
            emit(ChangePasswordSuccess(message: isRight['message'].toString()));
            currentPassController.clear();
            newPassController.clear();
            confirmPasswordController.clear();

          } catch (e) {
            safePrint("==>$e");
            emit(ChangePasswordError( "Parsing error: $e"));
          }
        }
      });
    });
  }


}
