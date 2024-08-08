part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsModel orderDetailsModel;
  OrderDetailsSuccess({required this.orderDetailsModel});
}

final class OrderDetailsError extends OrderDetailsState {
  final String error;
  OrderDetailsError({required this.error});
}
