import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/api/my_dio.dart';
import '../../../../core/utils/safe_print.dart';
import '../model/complaints_model.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

 Future <void> sendComplaints() async {
    emit(ComplaintsLoading());
    await MyDio.postData(endPoint: EndPoints.complaints,
        data: {
          "name": nameController.text,
          "phone": phoneController.text,
          "email": emailController.text,
          "message": messageController.text,
        }).then((response) {
      response.fold((error) {
        safePrint("Error: $error");
        emit(ComplaintsError( error: error.toString()));
      }, (isRight) async {
        safePrint("Response Data: $isRight");
        // Print the response for debugging
        if (isRight['status'] == false) {
          safePrint("Logout failed with message: ${isRight['message']}");
          emit(ComplaintsError(error:  "ERROR"));
        } else {
          try {
            ComplaintsModel complaintsModel = ComplaintsModel.fromJson(isRight);
            safePrint(complaintsModel.data);
            safePrint("Logout successful: ${complaintsModel.data}");
            emit(ComplaintsSuccess( complaintsModel: complaintsModel));
            nameController.clear();
            phoneController.clear();
            emailController.clear();
            messageController.clear();
          } catch (e) {
            safePrint("==>$e");
            emit(ComplaintsError(error:  "Parsing error: $e"));
          }
        }
      });
    });
  }
}
