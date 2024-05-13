import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';

part 'states.dart';

part 'events.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvents, ForgetPasswordStates> {
  ForgetPasswordBloc() : super(ForgetPasswordStates()) {
    on<ForgetPasswordEvent>(_sendData);
  }

  Future<void> _sendData(ForgetPasswordEvent event,
      Emitter<ForgetPasswordStates> emit,) async {
    emit(ForgetPasswordLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(ForgetPasswordSuccessState(msg: "Success"));
  }
}
