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
        child: Image.network('https://images.unsplash.com/photo-1557682257-2f9c37a3a5f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BsYXNoJTIwc2NyZWVufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
      )
    );
  }
}
