part of 'bloc.dart';

class OTPEvents {}

class OTPEvent extends OTPEvents {
  final String phone;
  final bool isAfterRegister;

  OTPEvent({required this.phone, required this.isAfterRegister});
}
