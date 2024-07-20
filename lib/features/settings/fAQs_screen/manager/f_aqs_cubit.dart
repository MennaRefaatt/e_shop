import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/api/my_dio.dart';
import '../../../../core/utils/safe_print.dart';
import '../model/f_a_q_s_model.dart';

part 'f_aqs_state.dart';

class FAqsCubit extends Cubit<FAqsState> {
  FAqsCubit() : super(FAqsInitial());

  Future<void> getFAQsData() async {
    emit(FAqsLoading());
    await MyDio.getData(endPoint: EndPoints.fAQs).then((response) {
      response.fold((error) {
        emit(FAqsFailure(error: error.toString()));
      }, (data) {

        // Print the response for debugging
        if (data['status'] == false) {
          emit(FAqsFailure(error: "ERROR"));
        } else {
          try {
            FAQsModel fAQSModel = FAQsModel.fromJson(data);
            safePrint(fAQSModel.data);
            emit(FAqsSuccess(fAQsModel: fAQSModel));
          } catch (e) {
            safePrint("==>"+e.toString());
            emit(FAqsFailure(error: "Parsing error: $e"));
          }
        }
      });
    });
  }

}
