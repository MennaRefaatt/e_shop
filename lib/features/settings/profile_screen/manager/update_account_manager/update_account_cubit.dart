import 'package:bloc/bloc.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../../../../core/api/endpoints.dart';
import '../../../../../../../core/api/my_dio.dart';
import '../../../../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../../../../core/utils/safe_print.dart';

part 'update_account_state.dart';

class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  UpdateAccountCubit() : super(UpdateAccountInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void init() {
    nameController.text = MyShared.getString(key: MySharedKeys.name);
    phoneController.text = MyShared.getString(key: MySharedKeys.phone);
    emailController.text = MyShared.getString(key: MySharedKeys.email);
  }

  updateAccount() async {
    emit(UpdateAccountLoading());
    MyDio.putData(endPoint: EndPoints.updateProfile, data: {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text
    }).then((onValue) {
      onValue.fold((ifLeft) {
        emit(UpdateAccountError(ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(UpdateAccountError("ERROR"));
          safePrint("==>${ifRight['token']}");
        }
        if (ifRight['status'] == true && ifRight['data'] != null) {
          emit(UpdateAccountSuccess(ifRight['message']));
          MyShared.putString(
              key: MySharedKeys.name, value: nameController.text);
          MyShared.putString(
              key: MySharedKeys.phone, value: phoneController.text);
          MyShared.putString(
              key: MySharedKeys.email, value: emailController.text);
        }
      });
    });
  }
}
