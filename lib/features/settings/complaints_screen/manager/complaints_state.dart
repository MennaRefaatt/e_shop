part of 'complaints_cubit.dart';

@immutable
sealed class ComplaintsState {}

final class ComplaintsInitial extends ComplaintsState {}

final class ComplaintsLoading extends ComplaintsState {}

final class ComplaintsSuccess extends ComplaintsState {
  final ComplaintsModel complaintsModel;
  ComplaintsSuccess({required this.complaintsModel});
}

final class ComplaintsError extends ComplaintsState {
  final String error;
  ComplaintsError({required this.error});
}
