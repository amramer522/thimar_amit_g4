part of 'bloc.dart';

class OTPStates {}

class OTPLoadingState extends OTPStates {}

class OTPSuccessState extends OTPStates {
  final String msg;

  OTPSuccessState({required this.msg}){
    showMessage("تم التأكيد بنجاح",isSuccess: true);
  }
}

class OTPFailedState extends OTPStates {
  final String msg;

  OTPFailedState({required this.msg}){
    showMessage(msg);
  }
}
