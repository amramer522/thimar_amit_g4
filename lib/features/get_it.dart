import 'package:get_it/get_it.dart';
import 'package:thimar_amit_g4/features/auth/forget_password/bloc.dart';
import 'package:thimar_amit_g4/features/auth/login/bloc.dart';
import 'package:thimar_amit_g4/features/auth/register/bloc.dart';
import 'package:thimar_amit_g4/features/main/categories/bloc.dart';
import 'package:thimar_amit_g4/features/main/products/bloc.dart';
import 'package:thimar_amit_g4/features/main/slider/bloc.dart';

import 'auth/cities/bloc.dart';
import 'auth/otp/bloc.dart';
import 'main/favorites/bloc.dart';
import 'my_account/privacy/bloc.dart';

void initGetIt(){
  final container = GetIt.instance;
  container.registerFactory(() => LoginBloc());
  container.registerFactory(() => ForgetPasswordBloc());
  container.registerFactory(() => RegisterBloc());
  container.registerFactory(() => CategoriesBloc());
  container.registerFactory(() => SliderBloc());
  container.registerFactory(() => ProductsBloc());
  container.registerFactory(() => FavoritesBloc());
  container.registerFactory(() => CitiesBloc());
  container.registerFactory(() => OTPBloc());
  container.registerFactory(() => PrivacyBloc());
}