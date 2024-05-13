import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/features/main/categories/model.dart';

part 'states.dart';

part 'events.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  CategoriesBloc() : super(CategoriesStates()) {
    on<GetCategoriesEvent>(_getData);
  }

  Future<void> _getData(GetCategoriesEvent event,
      Emitter<CategoriesStates> emit,) async {
    emit(GetCategoriesLoadingState());
    final response = await Dio().get("https://thimar.amr.aait-d.com/api/categories");
    final model = CategoriesData.fromJson(response.data);
    print(model.list.length);
    emit(GetCategoriesSuccessState(msg: "Success",list: model.list));
  }
}
