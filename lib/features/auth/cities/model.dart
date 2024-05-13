part of 'bloc.dart';

class CitiesData {
  late final List<CityModel> list;

  CitiesData.fromJson(Map<String, dynamic> json) {
    list = List.from(json["data"] ?? [])
        .map((e) => CityModel.fromJson(e))
        .toList();
  }
}

class CityModel {
  late int id;
  late String name;

  CityModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"] ?? "0") ?? 0;
    name = json["name"] ?? "";
  }
}
