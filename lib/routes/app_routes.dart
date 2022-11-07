import 'package:pr20221029/screens/about/about_screen.dart';
import 'package:pr20221029/screens/questionlist/question_list.dart';

import '../screens/home/home1_screen.dart';
import '../screens/splash_screen.dart';
import 'package:get/get.dart';
import '../screens/welcome/welcome_screen.dart';
import 'package:pr20221029/screens/login/login_screen.dart';


class AppRoutes {
  static List<GetPage> routes() =>
      [
        GetPage(name: "/", page: () => LoginPage()) //預設首頁
        //GetPage(name: "/introduction", page: () => SplashScreen())

      ];
}


