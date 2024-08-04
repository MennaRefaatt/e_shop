import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:e_shop/core/api/endpoints.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/shared_preferences/my_shared_keys.dart';
import 'package:e_shop/core/utils/safe_print.dart';

import '../model/login_success_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText1 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginLoading());
    await MyDio.postData(endPoint: EndPoints.login, data: {
      "email": emailController.text,
      "password": passwordController.text,
    }).then((onValue) {
      onValue.fold((ifLeft) {
        emit(LoginError(ifLeft));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(LoginError(ifRight['message']));
        }
        if (ifRight['status'] == true) {
          LoginSuccessResponse loginSuccessResponse =
              LoginSuccessResponse.fromJson(ifRight);
          safePrint(loginSuccessResponse.data!.token);
          await saveDataToLocal(loginData: loginSuccessResponse.data!)
              .then((value) {
            emit(LoginSuccess(loginSuccessResponse.message));
            emailController.clear();
            passwordController.clear();
          });
        }
      });
    }).catchError((onError) {
      emit(LoginError(onError.toString()));
    });
  }

  Future saveDataToLocal({required LoginData loginData}) async {
    MyShared.putString(key: MySharedKeys.apiToken, value: loginData.token);
    MyShared.putString(key: MySharedKeys.email, value: loginData.email);
    MyShared.putString(key: MySharedKeys.name, value: loginData.name);
    MyShared.putString(key: MySharedKeys.userId, value: loginData.id);
    MyShared.putString(key: MySharedKeys.userName, value: loginData.name);
    MyShared.putString(key: MySharedKeys.phone, value: loginData.phone);
  }
}
