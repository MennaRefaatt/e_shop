import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/api/my_dio.dart';
import '../model/terms_and_conditions_model.dart';

part 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsInitial());



  Future <void> getTermsAndConditions() async {
    emit(TermsAndConditionsLoading());
   await MyDio.getData(endPoint: EndPoints.settings).then((onValue) {
      onValue.fold((ifLeft){
        emit(TermsAndConditionsFailure(error:ifLeft.toString()));
      }, (ifRight) {
        if(ifRight['status']== false){
          emit(TermsAndConditionsFailure(error:"ERROR"));
        }
        if(ifRight['status']== true){
          TermsAndConditionsModel termsAndConditionsModel = TermsAndConditionsModel.fromJson(ifRight);
          emit(TermsAndConditionsSuccess(termsAndConditionsModel: termsAndConditionsModel));
        }
      });
}

    );
  }
}
