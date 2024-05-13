import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/views/auth/login/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (CacheHelper.isAuth) {
        navigateTo(HomePage(), keepHistory: false);
      } else {
        navigateTo(LoginView(), keepHistory: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppImage(
            "bg.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          PositionedDirectional(
            top: 350.79.h,
            start: 128.14.w,
            child: AppImage(
              "base_logo.png",
              height: 125.74,
              width: 139.96,
            ),
          ),
          PositionedDirectional(
            top: 365.61.h,
            start: 102.53.w,
            child: Transform.rotate(
              angle: pi / 4,
              child: SpinPerfect(
                duration: Duration(seconds: 2),
                child: AppImage(
                  "branch.png",
                  height: 125.02,
                  fit: BoxFit.fitHeight,
                  width: 90.19,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 328.h,
            start: 173.94.w,
            child: FadeInDownBig(
              duration: Duration(seconds: 2),
              child: AppImage(
                "leaves.png",
                height: 28.91,
                width: 45.97,
              ),
            ),
          )
        ],
      ),
    );
  }
}
