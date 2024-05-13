part of 'bloc.dart';

class ProductsStates {}

class GetProductsLoadingState extends ProductsStates {}

class GetProductsSuccessState extends ProductsStates {
  final String msg;
  final List<ProductModel> list;
  GetProductsSuccessState({required this.list,required this.msg});
}

class GetProductsFailedState extends ProductsStates {
  final String msg;

  GetProductsFailedState({required this.msg});
}
