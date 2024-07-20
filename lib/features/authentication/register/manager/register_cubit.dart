import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/api/my_dio.dart';
import '../../../../core/utils/safe_print.dart';
import '../model/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool obscureText1 = true;
  bool obscureText2 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  register() async {
    emit(RegisterLoadingState());
    await MyDio.postData(
        endPoint: EndPoints.register, data: {
      "email": emailController.text,
      "password": passController.text,
      "name": nameController.text,
      "phone": phoneController.text,
    }).then((onValue) {
      onValue.fold((ifLeft) {
        emit(RegisterErrorState(ifLeft));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(RegisterErrorState(ifRight['message']!.toString()));
          SnackBar(content: Text(ifRight['message']),);
        }
        if (ifRight['status'] == true) {
          RegisterSuccessResponse registerSuccessResponse =
          RegisterSuccessResponse.fromJson(ifRight);
          safePrint(registerSuccessResponse.data!.token);
            emit(RegisterSuccessState());
            nameController.clear();
            phoneController.clear();
            emailController.clear();
            passController.clear();
            confirmPasswordController.clear();
        }
      });
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
    });
  }

}
