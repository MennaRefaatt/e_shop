import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/my_dio.dart';
import '../../../core/utils/safe_print.dart';
import '../model/favourite_model.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  getFavouriteData() {
    emit(FavouriteLoading());
    MyDio.getData(endPoint: EndPoints.favorites).then((onValue) {
      onValue.fold((ifLeft){
        emit(FavouriteError(error:ifLeft.toString()));
      }, (ifRight) {
        if(ifRight['status']== false){
          emit(FavouriteError(error:ifRight['message'].toString()));
        }
        if(ifRight['status']== true){
          FavouriteModel favouriteModel = FavouriteModel.fromJson(ifRight);
          safePrint(favouriteModel.data!.data);
          emit(FavouriteSuccess(favouriteModel: favouriteModel));
        }
      });
    });
  }

  toggleFavourite({required int productId}) {
    emit(FavouriteLoading());
    MyDio.postData(endPoint: EndPoints.favorites, data: {'product_id': productId}).then((onValue) {
      onValue.fold((ifLeft) {
        emit(FavouriteError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(FavouriteError(error: "ERROR"));
        } else {
          FavouriteModel favouriteModel = FavouriteModel.fromJson(ifRight);
          safePrint(favouriteModel.data!.data);
          emit(FavouriteSuccess(favouriteModel: favouriteModel));
        }
      });
    });
  }
}
