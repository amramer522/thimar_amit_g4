import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar_amit_g4/core/design/app_button.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/core/design/app_input.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/core/logic/input_validator.dart';
import 'package:thimar_amit_g4/features/auth/login/bloc.dart';
import 'package:thimar_amit_g4/views/auth/components/auth_header.dart';
import 'package:thimar_amit_g4/views/auth/forget_password/view.dart';
import 'package:thimar_amit_g4/views/auth/register/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/view.dart';

import '../components/login_or_register.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = GetIt.I<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: bloc.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                AuthHeader(
                  title: "welcomeAgain".tr(),
                  desc: "youCanRegisterNow".tr(),
                ),
                AppInput(
                    controller: bloc.phoneController,
                    label: "phone".tr(),
                    validator: InputValidator.phone,
                    inputType: TextInputType.phone,
                    isPhone: true,
                    prefixIcon: "phone.png"),
                AppInput(
                    controller: bloc.passwordController,
                    label: "password".tr(),
                    validator: InputValidator.password,
                    isPassword: true,
                    prefixIcon: "password.png"),
                GestureDetector(
                  onTap: () {
                    navigateTo(ForgetPasswordView());
                  },
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "forgetPassword".tr(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff707070)),
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      navigateTo(HomeNavView(), keepHistory: false);
                    }
                  },
                  builder: (context, state) => AppButton(
                    text: "login".tr(),
                    isLoading: state is LoginLoadingState,
                    onPress: () {
                      bloc.add(LoginEvent());
                    },
                  ),
                ),
                LoginOrRegister(isFromLogin: true),
                IconButton(
                  onPressed: () {
                    String currentLang = context.locale.languageCode;
                    context
                        .setLocale(Locale(currentLang == "en" ? "ar" : "en"));
                  },
                  icon: Icon(Icons.language),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
