import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/features/order_details/model/cancel_order_model.dart';
import 'package:e_shop/features/order_details/model/order_details_model.dart';
import 'package:meta/meta.dart';
import '../../../core/api/endpoints.dart';
import '../../../core/utils/safe_print.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  void getOrderDetails({required String id}) {
    emit(OrderDetailsLoading());
    MyDio.getData(endPoint: EndPoints.getOrderDetails + id).then((onValue) {
      onValue.fold((ifLeft) {
        emit(OrderDetailsError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(OrderDetailsError(error: ifRight['message'].toString()));
        }
        if (ifRight['status'] == true) {
          OrderDetailsModel orderDetailsModel =
              OrderDetailsModel.fromJson(ifRight);
          safePrint(orderDetailsModel.data!);
          emit(OrderDetailsSuccess(orderDetailsModel: orderDetailsModel));
        }
      });
    });
  }

  cancelOrder({required int orderId}) {
    emit(OrderDetailsLoading());
    MyDio.getData(endPoint: EndPoints.cancelOrder(orderId)).then((onValue) {
      onValue.fold((ifLeft) {
        emit(CancelOrderError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(CancelOrderError(error: ifRight['message'].toString()));
        }
        if (ifRight['status'] == true) {
          CancelOrderModel cancelOrderModel =
              CancelOrderModel.fromJson(ifRight);
          safePrint(cancelOrderModel.message);
          emit(CancelOrderSuccess(cancelOrderModel: cancelOrderModel));
        }
      });
    });
  }
}
