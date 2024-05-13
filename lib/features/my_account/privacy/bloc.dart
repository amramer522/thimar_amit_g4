import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';

import '../../../core/logic/dio_helper.dart';

part 'states.dart';

part 'events.dart';

part 'model.dart';

class PrivacyBloc extends Bloc<PrivacyEvents, PrivacyStates> {
  PrivacyBloc() : super(PrivacyStates()) {
    on<GetPrivacyEvent>(_getData);
  }

  Future<void> _getData(GetPrivacyEvent event,
      Emitter<PrivacyStates> emit,) async {
    emit(GetPrivacyLoadingState());
    final response = await DioHelper.get("policy");
    if (response.isSuccess) {
      final model = PolicyData.fromJson(response.data).model;
      emit(GetPrivacySuccessState(model: model,msg: response.msg ?? ""));
    } else {
      emit(GetPrivacyFailedState(msg: response.msg ?? ""));
    }
  }
}
