import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_amit_g4/views/auth/login/view.dart';

import '../../../core/logic/helper_methods.dart';
import '../register/view.dart';

class LoginOrRegister extends StatelessWidget {
  final bool isFromLogin;
  final double? marginTop;

  const LoginOrRegister({Key? key, this.isFromLogin = false,  this.marginTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: marginTop??45.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFromLogin ? "noAccount".tr(): "haveAccount".tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextButton(
              onPressed: () {
                if (isFromLogin) {
                  navigateTo(RegisterView());
                } else {
                  navigateTo(LoginView());
                }
              },
              child: Text(isFromLogin ? "registerNow".tr() : "login".tr()),
            )
          ],
        ),
      ],
    );
  }
}
