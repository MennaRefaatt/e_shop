part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsSuccess extends ContactUsState {
  final ContactUsModel contactUsModel;
  ContactUsSuccess({required this.contactUsModel});
}

final class ContactUsError extends ContactUsState {
  final String error;
  ContactUsError({required this.error});
}
