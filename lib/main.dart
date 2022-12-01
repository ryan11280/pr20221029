import 'package:firebase_core/firebase_core.dart';
import 'package:pr20221029/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pr20221029/bindings/initial_bindings.dart';
import 'package:pr20221029/configs/themes/app_light_theme.dart';
import 'package:pr20221029/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:pr20221029/routes/app_routes.dart';
import 'package:pr20221029/screens/splash_screen.dart';
import 'configs/themes/app_dark_theme.dart';


void main() async{ //1115改future
  WidgetsFlutterBinding.ensureInitialized();//
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); //一定要給options
  InitialBindings().dependencies(); //初始化Bindings
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Get.find<ThemeController>().lightTheme, //initialize Default Theme
        getPages: AppRoutes.routes());
  }
}

/*
//Firebase 上傳測試
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//這個換到前面
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await Firebase.initializeApp(); //新版firebase需要先initialize 後加
  runApp(GetMaterialApp(home:DataUploaderScreen()));
}
 */
