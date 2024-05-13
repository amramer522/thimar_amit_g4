import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/features/main/slider/model.dart';

part 'states.dart';

part 'events.dart';

class SliderBloc extends Bloc<SliderEvents, SliderStates> {
  SliderBloc() : super(SliderStates()) {
    on<GetSliderEvent>(_getData);
  }

  Future<void> _getData(GetSliderEvent event,
      Emitter<SliderStates> emit,) async {
    emit(GetSliderLoadingState());
    final response = await Dio().get("https://thimar.amr.aait-d.com/api/sliders");
    final model = SliderData.fromJson(response.data);
    print(model.list.length);

    emit(GetSliderSuccessState(list: model.list,msg: "Success"));
  }
}
