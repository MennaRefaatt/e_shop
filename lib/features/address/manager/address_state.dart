part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {
  final AddressModel addressModel;
  AddressSuccess({required this.addressModel});
}

final class AddressError extends AddressState {
  final String error;
  AddressError({required this.error});
}
