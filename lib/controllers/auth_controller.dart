import 'package:firebase_core/firebase_core.dart';
import 'package:pr20221029/firebase_options.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{
  @override
  void onReady(){
    initAuth(); //先叫這個
    super.onReady();
  }

  void initAuth() async{
    //await Future.delayed(const Duration(seconds: 2)); //延遲2s後再跳轉 用於splash過渡 暫移除
    //WidgetsFlutterBinding.ensureInitialized(); //加
    //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,); //加options
    //navigateToWhere(); //再來叫到這
  }

  void navigateToWhere(){
    //Get.offAllNamed("/"); //最後叫這 用於splash過渡 暫改home
  }
}