import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/my_dio.dart';
import '../../../core/utils/safe_print.dart';
import '../model/confirm_order_model.dart';

part 'confirm_order_state.dart';

class ConfirmOrderCubit extends Cubit<ConfirmOrderState> {
  ConfirmOrderCubit() : super(ConfirmOrderInitial());
  final paymentMethodController = TextEditingController();
  addConfirmOrderData() {
    safePrint("Calling addConfirmOrderData...");
    emit(ConfirmOrderLoading());
    MyDio.postData(endPoint: EndPoints.addOrders, data: {}).then((onValue) {
      onValue.fold((ifLeft) {
        safePrint("API call failed: $ifLeft");
        emit(ConfirmOrderError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(ConfirmOrderError(error: ifRight['message']));
        }
        if (ifRight['status'] == true) {
          safePrint("API call successful: $ifRight");
          ConfirmOrderModel confirmOrderModel =
              ConfirmOrderModel.fromJson(ifRight);
          emit(ConfirmOrderSuccess(confirmOrderModel: confirmOrderModel));
        }
      });
    }).catchError((onError) {
      safePrint("API call error: $onError");
      emit(ConfirmOrderError(error: onError.toString()));
    });
  }
}
