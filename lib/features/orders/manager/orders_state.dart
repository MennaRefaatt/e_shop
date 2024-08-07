part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<OrderDataList> currentOrders;
  final List<OrderDataList> oldOrders;

  OrdersSuccess({required this.currentOrders, required this.oldOrders});
}

final class OrdersError extends OrdersState {
  final String error;
  OrdersError({required this.error});
}
