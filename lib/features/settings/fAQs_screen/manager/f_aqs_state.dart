part of 'f_aqs_cubit.dart';

@immutable
sealed class FAqsState {}

final class FAqsInitial extends FAqsState {}

final class FAqsLoading extends FAqsState {}
final class FAqsSuccess extends FAqsState {
  final FAQsModel fAQsModel;
  FAqsSuccess({required this.fAQsModel});
}
final class FAqsFailure extends FAqsState {
  final String error;
  FAqsFailure({required this.error});
}
