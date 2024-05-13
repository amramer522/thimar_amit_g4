part of 'bloc.dart';
class PolicyData {
  late final PolicyModel model;


  PolicyData.fromJson(Map<String, dynamic> json){
    model = PolicyModel.fromJson(json['data']??{});
  }
}

class PolicyModel {
  late final String policy;

  PolicyModel.fromJson(Map<String, dynamic> json){
    policy = json['policy']??"";
  }
}