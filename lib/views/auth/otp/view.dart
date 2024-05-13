import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_amit_g4/core/design/app_button.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/views/auth/login/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/view.dart';

import '../../../features/auth/otp/bloc.dart';
import '../components/auth_header.dart';
import '../components/login_or_register.dart';

class OTPView extends StatefulWidget {
  final String phone;
  final bool isAfterRegister;
  const OTPView({Key? key, required this.phone, required this.isAfterRegister}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  void initState() {
    super.initState();
  }

  final bloc = GetIt.instance<OTPBloc>();
  bool isTimerShown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AuthHeader(
              title: "تفعيل الحساب",
              desc: "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
              marginBottom: 4.h,
            ),
            Row(
              children: [
                Text("+${widget.phone}",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    )),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("تغيير رقم الجوال",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor)),
                )
              ],
            ),
            SizedBox(height: 30.h),
            PinCodeTextField(
              appContext: context,
              controller: bloc.codeController,
              length: 4,
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                  fieldHeight: 60.h,
                  fieldWidth: 70.w,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).primaryColor,
                  // inactiveColor: Colors.red,
                  inactiveColor: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(15),
                  shape: PinCodeFieldShape.box),
            ),
            SizedBox(height: 37.h),
            BlocConsumer(
                bloc: bloc,
                listener: (context, state) {
                  if (state is OTPSuccessState) {
                    navigateTo(
                      HomeNavView(),
                      keepHistory: false,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    text: "تأكيد الكود",
                    isLoading: state is OTPLoadingState,
                    onPress: () {
                      bloc.add(OTPEvent(phone: widget.phone,isAfterRegister: widget.isAfterRegister));
                    },
                  );
                }),
            SizedBox(height: 27.h),
            Text(
              "لم تستلم الكود ؟\n يمكنك إعادة إرسال الكود بعد",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 21.h),
            if (isTimerShown)
              CircularCountDownTimer(
                onComplete: () {
                  isTimerShown = false;
                  setState(() {});
                },
                width: 66.w,
                height: 70.h,
                duration: 5,
                autoStart: true,
                isReverseAnimation: true,
                textStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor),
                textFormat: CountdownTextFormat.MM_SS,
                fillColor: Theme.of(context).primaryColor,
                isReverse: true,
                ringColor: Color(0xffD8D8D8),
              ),
            SizedBox(height: 19.h),
            if (!isTimerShown)
              OutlinedButton(
                onPressed: () {
                  isTimerShown = true;
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Text("إعادة الإرسال"),
              ),
            LoginOrRegister(isFromLogin: false, marginTop: 20),
          ],
        ),
      ),
    );
  }
}
