import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_shop/core/api/endpoints.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:e_shop/features/home/model/home_model.dart';

import '../../categories/manager/categories_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  getHomeData() {
    emit(HomeLoading());
    MyDio.getData(endPoint: EndPoints.home).then((onValue) {
      onValue.fold((ifLeft){
        emit(HomeFailure(error:ifLeft.toString()));
      }, (ifRight) {
        if(ifRight['status']== false){
          emit(HomeFailure(error:"ERROR"));
        }
        if(ifRight['status']== true){
          HomeModel homeModel = HomeModel.fromJson(ifRight);
        safePrint(homeModel.data!.products[0].price);
          emit(HomeSuccess(homeModel: homeModel));
        }
      });

    });
  }


}
