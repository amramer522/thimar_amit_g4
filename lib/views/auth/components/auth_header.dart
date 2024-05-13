import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_image.dart';

class AuthHeader extends StatelessWidget {
  final String title,desc;
  final double? marginBottom;
  const AuthHeader({Key? key, required this.title, required this.desc, this.marginBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AppImage(
            "logo.png",
            height: 125.72,
            width: 129.83,
          ),
        ),
        SizedBox(height: 21.h),
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.h),
        Text(
         desc,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff707070)),
        ),
        SizedBox(height: marginBottom??28.h),
      ],
    );
  }
}
