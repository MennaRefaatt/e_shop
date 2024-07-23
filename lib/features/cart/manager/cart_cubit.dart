import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/endpoints.dart';
import '../../../core/api/my_dio.dart';
import '../../../core/utils/safe_print.dart';
import '../model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartData() {
    emit(CartLoading());
    MyDio.getData(endPoint: EndPoints.cart).then((onValue) {
      onValue.fold((ifLeft) {
        emit(CartError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(CartError(error: ifRight['message'].toString()));
        }
        if (ifRight['status'] == true) {
          CartModel cartModel = CartModel.fromJson(ifRight);
          safePrint(cartModel.data!);
          emit(CartSuccess(cartModel: cartModel));
        }
      });
    });
  }

  addProductToCart({required int productId}) {
    emit(CartLoading());
    MyDio.postData(endPoint: EndPoints.cart, data: {'product_id': productId})
        .then((onValue) {
      onValue.fold((ifLeft) {
        emit(CartError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(CartError(error: "ERROR"));
        }
        if (ifRight['status'] == true) {
          CartModel cartModel = CartModel.fromJson(ifRight);
          _recalculateTotals(cartModel);
          safePrint(cartModel.data!);
          emit(CartSuccess(cartModel: cartModel));
        }
      });
    });
  }

  removeProductFromCart({required int cartId}) {
    emit(CartLoading());
    MyDio.deleteData(endPoint: EndPoints.cartDelete + cartId.toString())
        .then((onValue) {
      onValue.fold((ifLeft) {
        emit(CartError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(CartError(error: "ERROR"));
        }
        if (ifRight['status'] == true) {
          CartModel cartModel = CartModel.fromJson(ifRight);
          _recalculateTotals(cartModel);
          safePrint(cartModel.data!);
          emit(CartSuccess(cartModel: cartModel));
        }
      });
    });
  }

  updateProductQuantity({required int cartId, required int quantity}) {
    emit(CartLoading());
    MyDio.putData(
        endPoint: EndPoints.cartUpdate + cartId.toString(),
        data: {'quantity': quantity}).then((onValue) {
      onValue.fold((ifLeft) {
        emit(CartError(error: ifLeft.toString()));
      }, (ifRight) {
        if (ifRight['status'] == false) {
          emit(CartError(error: "ERROR"));
        }
        if (ifRight['status'] == true) {
          CartModel cartModel = CartModel.fromJson(ifRight);
          _recalculateTotals(cartModel);
          safePrint(cartModel.data!);
          emit(CartSuccess(cartModel: cartModel));
        }
      });
    });
  }

  void _recalculateTotals(CartModel cartModel) {
    int newSubTotal = 0;
    int newTotal = 0;

    for (var item in cartModel.data!.items) {
      int itemTotal = item.quantity * int.parse(item.product!.price);
      newSubTotal += itemTotal;
    }

    // Add any additional logic for total calculation if needed
    newTotal = newSubTotal; // Adjust if there are other fees or discounts

    cartModel.data!.subTotal = newSubTotal;
    cartModel.data!.total = newTotal;
  }
}
