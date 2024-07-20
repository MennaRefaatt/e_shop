part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final CategoriesModel categoriesModel;
  CategoriesSuccess({required this.categoriesModel});
}
final class CategoriesFailure extends CategoriesState {
  final String error;
  CategoriesFailure({required this.error});
}

