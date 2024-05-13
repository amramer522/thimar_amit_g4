part of 'bloc.dart';

class PrivacyStates {}

class GetPrivacyLoadingState extends PrivacyStates {}

class GetPrivacySuccessState extends PrivacyStates {
  final String msg;
  final PolicyModel model;

  GetPrivacySuccessState({required this.model, required this.msg});
}

class GetPrivacyFailedState extends PrivacyStates {
  final String msg;

  GetPrivacyFailedState({required this.msg});
}
