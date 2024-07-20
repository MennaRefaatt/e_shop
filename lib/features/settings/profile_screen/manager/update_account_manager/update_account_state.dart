part of 'update_account_cubit.dart';

@immutable
sealed class UpdateAccountState {}

final class UpdateAccountInitial extends UpdateAccountState {}

final class UpdateAccountLoading extends UpdateAccountState {}

final class UpdateAccountSuccess extends UpdateAccountState {
  final String message;
  UpdateAccountSuccess(this.message);
}

final class UpdateAccountError extends UpdateAccountState {
  final String error;
  UpdateAccountError(this.error);
}
