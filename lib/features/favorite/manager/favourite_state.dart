part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteSuccess extends FavouriteState {
  final FavouriteModel favouriteModel;
  FavouriteSuccess({required this.favouriteModel});
}

final class FavouriteError extends FavouriteState {
  final String error;
  FavouriteError({required this.error});
}
