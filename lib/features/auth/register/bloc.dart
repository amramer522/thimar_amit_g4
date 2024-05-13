import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/dio_helper.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';

import '../cities/bloc.dart';

part 'states.dart';

part 'events.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEvent>(_sendData);
  }

  final phoneController = TextEditingController(text: "55000001111122");
  final confirmPasswordController = TextEditingController(text: "0000000000");
      final userNameController = TextEditingController(text: "ahmed");
  final cityController = TextEditingController();
  final passwordController = TextEditingController(text: "0000000000");
  final formKey = GlobalKey<FormState>();
  CityModel? result;

  Future<void> _sendData(RegisterEvent event,
      Emitter<RegisterStates> emit,) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final response = await DioHelper.send("client_register", data: {
        "fullname": userNameController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
        "phone": phoneController.text,
        "city_id": result!.id,
        "country_id": 1
      });
      if (response.isSuccess) {
        emit(RegisterSuccessState(msg: response.msg ?? ""));
      } else {
        emit(RegisterFailedState(msg: response.msg ?? ""));
      }
    }
  }
}
