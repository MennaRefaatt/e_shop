part of 'confirm_order_cubit.dart';

@immutable
sealed class ConfirmOrderState {}

final class ConfirmOrderInitial extends ConfirmOrderState {}

final class ConfirmOrderLoading extends ConfirmOrderState {}

final class ConfirmOrderSuccess extends ConfirmOrderState {
  final ConfirmOrderModel confirmOrderModel;
  ConfirmOrderSuccess({required this.confirmOrderModel});
}

final class ConfirmOrderError extends ConfirmOrderState {
  final String error;
  ConfirmOrderError({required this.error});
}
