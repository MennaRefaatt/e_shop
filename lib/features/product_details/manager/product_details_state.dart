part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {

  final ProductDetailsModel productDetailsModel;
  ProductDetailsSuccess({required this.productDetailsModel});
}

final class ProductDetailsError extends ProductDetailsState {

  final String error;
  ProductDetailsError({required this.error});
}
