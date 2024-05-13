import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final Color? color;
  final BoxFit fit;

  const AppImage(
    this.url, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.scaleDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Container(
        color: Colors.transparent,
        child: Center(
          child: Lottie.asset(
            "assets/lotties/loading.json",
          ),
        ),
      );
    }

    if (url.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/svg/$url",
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
      );
    } else if (url.startsWith("http")) {
      return Image.network(
        url,
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => Center(
          child: Text(
            "404",
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      );
    } else {
      return Image.asset(
        "assets/images/$url",
        height: height?.h,
        width: width?.w,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => Text("404"),
      );
    }
  }
}
