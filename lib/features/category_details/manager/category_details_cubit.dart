import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/my_dio.dart';
import '../../../core/utils/safe_print.dart';
import '../model/category_details_model.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());


  void getCategoryDetails({required String categoryId}) {
    emit(CategoryDetailsLoading());
    MyDio.getData(endPoint: EndPoints.categoryDetails+categoryId).then((onValue) {
      onValue.fold((ifLeft){
        emit(CategoryDetailsError(error:ifLeft.toString()));
      }, (ifRight) {
        if(ifRight['status']== false){
          emit(CategoryDetailsError(error:"ERROR"));
        }
        if(ifRight['status']== true){
           CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel.fromJson(ifRight);
          safePrint(categoryDetailsModel.data!);
          emit(CategoryDetailsSuccess(categoryDetailsModel: categoryDetailsModel));
        }
      });
    });
  }
}
