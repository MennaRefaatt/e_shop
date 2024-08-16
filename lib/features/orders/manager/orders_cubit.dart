import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/endpoints.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:e_shop/features/orders/model/orders_model.dart';
import 'package:meta/meta.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void getOrders() {
    emit(OrdersLoading());
    MyDio.getData(
      endPoint: EndPoints.getOrders,
    ).then((onValue) {
      onValue.fold((ifLeft) {
        emit(OrdersError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(OrdersError(error: "ERROR"));
        }
        if (ifRight['status'] == true) {
          OrdersModel ordersModel = OrdersModel.fromJson(ifRight);
          List<OrderDataList> currentOrders = [];
          List<OrderDataList> oldOrders = [];

          for (var order in ordersModel.data.data) {
            if (order.status == "New" || order.status == "جديد") {
              currentOrders.add(order);
            } else if (order.status == "Cancelled" ||
                order.status == "delivered" || order.status == "ملغي") {
              oldOrders.add(order);
            }
          }
          emit(OrdersSuccess(
              currentOrders: currentOrders, oldOrders: oldOrders));
        }
      });
    });
  }
}
