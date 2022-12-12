import 'package:firebase_core/firebase_core.dart';
import 'package:pr20221029/firebase_options.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth(); //先叫這個
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 1)); //延遲1s後再跳轉 用於splash過渡
    WidgetsFlutterBinding.ensureInitialized(); //加
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ); //加options
    navigateToHome(); //再來叫到這
  }

  void navigateToHome() {
    //Get.offAllNamed("/"); //最後叫這 用於splash過渡 暫改home
    //go to home
    Get.offAllNamed("/login"); //最後叫這
  }
}
