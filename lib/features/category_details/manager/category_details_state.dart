part of 'category_details_cubit.dart';

@immutable
sealed class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}


final class CategoryDetailsLoading extends CategoryDetailsState {}


final class CategoryDetailsSuccess extends CategoryDetailsState {
  final CategoryDetailsModel categoryDetailsModel;
  CategoryDetailsSuccess({required this.categoryDetailsModel});
}

final class CategoryDetailsError extends CategoryDetailsState {
  final String error;
  CategoryDetailsError({required this.error});
}
