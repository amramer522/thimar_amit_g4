import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final navKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page, {bool keepHistory = true}) {
  Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => keepHistory);
}

void showMessage(String msg, {bool isSuccess = false}) {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        content: Center(
          child: Text(
            msg,
            style: TextStyle(
                color: isSuccess ? Colors.white : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}



Future<void> openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    showMessage('Could not launch $url');
  }
}