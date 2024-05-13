import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPress;
  const AppButton({Key? key, required this.text, this.onPress,  this.isLoading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPress,
        child: Text(
          text,
        ),
      ),
    );
  }
}
