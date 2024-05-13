part of 'bloc.dart';



class CitiesStates {}

class GetCitiesLoadingState extends CitiesStates {}

class GetCitiesFailedState extends CitiesStates {
  final String msg;

  GetCitiesFailedState({required this.msg});
}

class GetCitiesSuccessState extends CitiesStates {
  final List<CityModel> list;

  GetCitiesSuccessState({required this.list});

}
