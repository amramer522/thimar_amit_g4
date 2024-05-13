part of 'bloc.dart';

class FavoritesStates {}

class GetFavoritesLoadingState extends FavoritesStates {}

class GetFavoritesSuccessState extends FavoritesStates {
  final String msg;

  GetFavoritesSuccessState({required this.msg});
}

class GetFavoritesFailedState extends FavoritesStates {
  final String msg;

  GetFavoritesFailedState({required this.msg});
}
