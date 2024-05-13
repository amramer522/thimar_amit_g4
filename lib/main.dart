import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimar_amit_g4/core/logic/cache_helper.dart';
import 'package:thimar_amit_g4/features/auth/login/bloc.dart';
import 'package:thimar_amit_g4/features/get_it.dart';
import 'package:thimar_amit_g4/views/auth/login/view.dart';
import 'package:thimar_amit_g4/views/auth/register/view.dart';
import 'package:thimar_amit_g4/views/auth/splash/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/view.dart';

import 'core/logic/firebase_helper.dart';
import 'core/logic/helper_methods.dart';
import 'firebase_options.dart';
import 'views/auth/otp/view.dart';
import 'views/main/home_nav/pages/favorites/view.dart';
import 'views/main/home_nav/view.dart';
import 'views/my_account/add_address/view.dart';
import 'views/my_account/privacy/view.dart';
import 'views/my_account/profile/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final firebaseHelper = FirebaseHelper();
    await firebaseHelper.setupFlutterNotifications();
    firebaseHelper.getToken();
  }

  initGetIt();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        startLocale: Locale('ar'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        child: LoginView(),
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Thimar',
            navigatorKey: navKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                fontFamily: "Tajawal",
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff4C8613)),
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  surfaceTintColor: Colors.white,
                  titleTextStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4C8613),
                    fontFamily: "Tajawal"
                  )
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w700))),
                filledButtonTheme: FilledButtonThemeData(
                    style: FilledButton.styleFrom(
                        fixedSize: Size.fromHeight(60.h),
                        textStyle: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w700),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)))),
                inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color(0xffF3F3F3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color(0xffF3F3F3),
                      ),
                    ))),
            home: child,
          );
        });
  }
}
