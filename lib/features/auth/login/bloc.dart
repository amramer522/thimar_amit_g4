import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/view.dart';

import '../../../core/logic/dio_helper.dart';

part 'states.dart';

part 'events.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginEvent>(_sendData);
  }

  final phoneController = TextEditingController(text: "55000001111122");
  final passwordController = TextEditingController(text: "0000000000");
  final formKey = GlobalKey<FormState>();

  Future<void> _sendData(
    LoginEvent event,
    Emitter<LoginStates> emit,
  ) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await DioHelper.send(
        "login",
        data: {
          "phone": phoneController.text,
          "password": passwordController.text,
          "device_token":CacheHelper.fcmToken,
          "type":Platform.operatingSystem,
          "user_type":"client"
        },
      );
      if (response.isSuccess) {
        emit(LoginSuccessState(msg: response.msg ?? ""));
      } else {
        emit(LoginFailedState(msg: response.msg ?? ""));
      }
      // await CacheHelper.setIsAuth();
      // await CacheHelper.setPhone(phoneController.text);
      // await CacheHelper.setPassword(
      //     passwordController.text);
    }
  }
}
