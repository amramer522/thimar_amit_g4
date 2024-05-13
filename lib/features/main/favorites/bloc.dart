import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';

part 'states.dart';

part 'events.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesStates> {
  FavoritesBloc() : super(FavoritesStates()) {
    on<GetFavoritesEvent>(_getData);
  }

  Future<void> _getData(GetFavoritesEvent event,
      Emitter<FavoritesStates> emit,) async {
    emit(GetFavoritesLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(GetFavoritesSuccessState(msg: "Success"));
  }
}
