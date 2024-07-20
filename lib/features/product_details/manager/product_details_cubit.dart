
import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/features/product_details/model/product_details_model.dart';
import 'package:e_shop/generated/l10n.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/utils/safe_print.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails({required String productId}) {
    emit(ProductDetailsLoading());
    MyDio.getData(endPoint: EndPoints.productDetails+productId).then((onValue) {
      onValue.fold((ifLeft){
        emit(ProductDetailsError(error:ifLeft.toString()));
      }, (ifRight) {
        if(ifRight['status']== false){
          emit(ProductDetailsError(error:"ERROR"));
        }
        if(ifRight['status']== true){
           ProductDetailsModel productDetailsModel = ProductDetailsModel.fromJson(ifRight);
          safePrint(productDetailsModel.data!);
          emit(ProductDetailsSuccess(productDetailsModel: productDetailsModel));
        }
      });
    });
}
}
