import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class AppInput extends StatefulWidget {
  final String label, prefixIcon;
  final TextInputType? inputType;
  final bool isPhone;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppInput({
    Key? key,
    required this.label,
    required this.prefixIcon,
    this.isPhone = false,
    this.inputType,
    this.isPassword = false, this.controller, this.validator,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            validator: widget.validator,
            obscureText: widget.isPassword && isHidden,
            decoration: InputDecoration(
                labelText: widget.label,
                icon: widget.isPhone
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xffF3F3F3))),
                        padding: EdgeInsets.symmetric(horizontal: 18.5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage(
                              "suadi.png",
                              height: 20.h,
                              width: 32.w,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "+966",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                              textDirection: TextDirection.ltr,
                            )
                          ],
                        ),
                      )
                    : null,
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 17.4.w, top: 19.h, bottom: 19.h, end: 9.3.w),
                  child: AppImage(
                    widget.prefixIcon,
                    height: 22.h,
                    width: 22.w,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        child: Icon(
                            isHidden ? Icons.visibility_off : Icons.visibility),
                        onTap: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                      )
                    : null),
          ),
        ),
        SizedBox(height: 16.h)
      ],
    );
  }
}
