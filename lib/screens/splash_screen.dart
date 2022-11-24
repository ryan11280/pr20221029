import 'package:flutter/material.dart';
import 'package:pr20221029/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)), //傳送去判斷顯示模式
        child: Image.asset(
          'assets/images/qalogo.png',
          width: 300,
          height: 300,
        ),
      )
    );
  }
}
