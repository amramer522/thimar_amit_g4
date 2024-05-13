import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/features/auth/cities/bloc.dart';
import 'package:thimar_amit_g4/features/auth/register/bloc.dart';
import 'package:thimar_amit_g4/views/auth/otp/view.dart';
import 'package:thimar_amit_g4/views/sheets/cities.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/input_validator.dart';
import '../components/auth_header.dart';
import '../components/login_or_register.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final bloc = GetIt.I<RegisterBloc>();

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
                  desc: "يمكنك تسجيل حساب جديد الأن",
                ),
                AppInput(
                    controller: bloc.userNameController,
                    validator: InputValidator.userName,
                    label: "اسم المستخدم",
                    prefixIcon: "user_name.png"),
                AppInput(
                    controller: bloc.phoneController,
                    label: "phone".tr(),
                    validator: InputValidator.phone,
                    inputType: TextInputType.phone,
                    isPhone: true,
                    prefixIcon: "phone.png"),
                GestureDetector(
                  onTap: () async {
                    final result = await showModalBottomSheet(
                      context: context,
                      builder: (context) => CitiesSheet(),
                    );

                    if (result != null) {
                      bloc.result =result;
                      bloc.cityController.text = bloc.result!.name;
                    }
                  },
                  child: AbsorbPointer(
                    child: AppInput(
                        label: "المدينة",
                        controller: bloc.cityController,
                        validator: InputValidator.city,
                        prefixIcon: "city.png"),
                  ),
                ),
                AppInput(
                    controller: bloc.passwordController,
                    label: "password".tr(),
                    validator: (value) {
                      return InputValidator.passwordForRegister(
                          value, bloc.confirmPasswordController.text);
                    },
                    isPassword: true,
                    prefixIcon: "password.png"),
                AppInput(
                    controller: bloc.confirmPasswordController,
                    label: "password".tr(),
                    validator: (value) {
                      return InputValidator.confirmPasswordForRegister(
                          value, bloc.passwordController.text);
                    },
                    isPassword: true,
                    prefixIcon: "password.png"),
                SizedBox(height: 22.h),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      navigateTo(
                        OTPView(
                          phone: bloc.phoneController.text,
                          isAfterRegister: true,
                        ),
                      );
                    }
                  },
                  builder: (context, state) => AppButton(
                    text: "تسجيل",
                    isLoading: state is RegisterLoadingState,
                    onPress: () {
                      bloc.add(RegisterEvent());
                    },
                  ),
                ),
                LoginOrRegister(isFromLogin: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
