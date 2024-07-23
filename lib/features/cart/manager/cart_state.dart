part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartModel cartModel;
  CartSuccess({required this.cartModel});
}

final class CartError extends CartState {
  final String error;
  CartError({required this.error});
}
