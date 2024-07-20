import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/api/my_dio.dart';
import '../../../../core/utils/safe_print.dart';
import '../model/contact_us_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());


  Future <void> getContactUs() async{
    emit(ContactUsLoading());
    MyDio.getData(endPoint: EndPoints.contactUs).then((onValue) {
      onValue.fold((ifLeft){
        emit(ContactUsError(error:ifLeft.toString()));

      }, (ifRight) {
        if(ifRight['status']== false){
          emit(ContactUsError(error:"ERROR"));
          safePrint(ifRight["data"]);
        }
        if(ifRight['status']== true){
          ContactUsModel contactUsModel = ContactUsModel.fromJson(ifRight);
          safePrint(contactUsModel.data!.data[0].image);
          safePrint(contactUsModel.data!.data[0].value);
          emit(ContactUsSuccess(contactUsModel: contactUsModel));
        }
      });

    });
  }
}
