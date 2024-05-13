import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'model.dart';

part 'states.dart';

part 'events.dart';

class CitiesBloc extends Bloc<CitiesEvents, CitiesStates> {
  CitiesBloc() : super(CitiesStates()) {
    on<GetCitiesEvent>(_getData);
  }

  Future<void> _getData(
      GetCitiesEvent event, Emitter<CitiesStates> emit) async {
    emit(GetCitiesLoadingState());
    final response =
        await Dio().get("https://thimar.amr.aait-d.com/api/cities/1");
    final data = CitiesData.fromJson(response.data);
    emit(GetCitiesSuccessState(list: data.list));
  }
}
