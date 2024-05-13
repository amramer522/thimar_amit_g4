part of 'bloc.dart';

class CategoriesStates {}

class GetCategoriesLoadingState extends CategoriesStates {}

class GetCategoriesSuccessState extends CategoriesStates {
  final String msg;
  final List<CategoryModel>list;

  GetCategoriesSuccessState({required this.list ,required this.msg});
}

class GetCategoriesFailedState extends CategoriesStates {
  final String msg;

  GetCategoriesFailedState({required this.msg});
}
