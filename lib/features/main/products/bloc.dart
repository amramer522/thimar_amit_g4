import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/features/main/products/model.dart';

part 'states.dart';

part 'events.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsStates> {
  ProductsBloc() : super(ProductsStates()) {
    on<GetProductsEvent>(_getData);
  }

  Future<void> _getData(GetProductsEvent event,
      Emitter<ProductsStates> emit,) async {
    emit(GetProductsLoadingState());
    final response = await Dio().get("https://thimar.amr.aait-d.com/api/products");
    final model = ProductsData.fromJson(response.data);
    emit(GetProductsSuccessState(msg: "Success",list: model.list));
  }
}
