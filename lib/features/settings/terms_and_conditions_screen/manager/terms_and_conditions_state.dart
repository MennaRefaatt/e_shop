part of 'terms_and_conditions_cubit.dart';

@immutable
sealed class TermsAndConditionsState {}

final class TermsAndConditionsInitial extends TermsAndConditionsState {}

final class TermsAndConditionsLoading extends TermsAndConditionsState {}

final class TermsAndConditionsSuccess extends TermsAndConditionsState {
  final TermsAndConditionsModel termsAndConditionsModel;
  TermsAndConditionsSuccess({required this.termsAndConditionsModel});
}

final class TermsAndConditionsFailure extends TermsAndConditionsState {
  final String error;
  TermsAndConditionsFailure({required this.error});
}
