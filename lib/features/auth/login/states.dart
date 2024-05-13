part of 'bloc.dart';

class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String msg;

  LoginSuccessState({required this.msg}) {
    showMessage(msg, isSuccess: true);
  }
}

class LoginFailedState extends LoginStates {
  final String msg;

  LoginFailedState({required this.msg}) {
    showMessage(msg);
  }
}
