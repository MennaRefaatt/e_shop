// import 'package:bloc/bloc.dart';
// import 'package:e_shop/features/categories/model/categories_model.dart';
// import 'package:meta/meta.dart';
//
// import '../../../core/api/endpoints.dart';
// import '../../../core/api/my_dio.dart';
// import '../../../core/utils/safe_print.dart';
//
// part 'categories_state.dart';
//
// class CategoriesCubit extends Cubit<CategoriesState> {
//   CategoriesCubit() : super(CategoriesInitial());
//
//   getCategoriesData() {
//     emit(CategoriesLoading());
//     MyDio.getData(endPoint: EndPoints.categories).then((onValue) {
//       onValue.fold((ifLeft){
//         emit(CategoriesFailure(error:ifLeft.toString()));
//       }, (ifRight) {
//         if(ifRight['status']== false){
//           emit(CategoriesFailure(error:"ERROR"));
//         }
//         if(ifRight['status']== true){
//            CategoriesModel categoriesModel = CategoriesModel.fromJson(ifRight);
//           safePrint(categoriesModel.data!);
//           emit(CategoriesSuccess(categoriesModel: categoriesModel));
//         }
//       });
//
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:e_shop/features/categories/model/categories_model.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/my_dio.dart';
import '../../../core/utils/safe_print.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getCategoriesData() async {
    emit(CategoriesLoading());
   await MyDio.getData(endPoint: EndPoints.categories).then((response) {
      response.fold((error) {
        emit(CategoriesFailure(error: error.toString()));
      }, (data) {

        // Print the response for debugging
        if (data['status'] == false) {
          emit(CategoriesFailure(error: "ERROR"));
        } else {
          try {
            CategoriesModel categoriesModel = CategoriesModel.fromJson(data);
              safePrint(categoriesModel.data);
              emit(CategoriesSuccess(categoriesModel: categoriesModel));
          } catch (e) {
            safePrint("==>"+e.toString());
            emit(CategoriesFailure(error: "Parsing error: $e"));
          }
        }
      });
    });
  }


}
