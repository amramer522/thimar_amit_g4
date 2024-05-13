import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/core/logic/dio_helper.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';

part 'states.dart';

part 'events.dart';

class OTPBloc extends Bloc<OTPEvents, OTPStates> {
  OTPBloc() : super(OTPStates()) {
    on<OTPEvent>(_sendData);
  }

  final codeController = TextEditingController();

  Future<void> _sendData(
    OTPEvent event,
    Emitter<OTPStates> emit,
  ) async {
    emit(OTPLoadingState());
    final response = await DioHelper.send(
      event.isAfterRegister ? "verify" : "check_code",
      data: {
        "phone": event.phone,
        "code": codeController.text,
        "device_token": event.isAfterRegister ? CacheHelper.fcmToken : null,
        "type": event.isAfterRegister ? Platform.operatingSystem : null
      },
    );
    if (response.isSuccess) {
      emit(OTPSuccessState(msg: response.msg ?? ""));
    } else {
      emit(OTPFailedState(msg: response.msg ?? ""));
    }
  }
}
