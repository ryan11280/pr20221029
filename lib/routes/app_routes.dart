import 'package:pr20221029/screens/about/about_screen.dart';
import 'package:pr20221029/screens/create/create_question.dart';
import 'package:pr20221029/screens/questionlist/question_list.dart';
import 'package:pr20221029/screens/testing/dataFetchTest.dart';
import '../screens/home/home.dart';
import '../screens/home/home1_screen.dart';
import '../screens/quiz/GsScreen.dart';
import '../screens/splash_screen.dart';
import 'package:get/get.dart';
import '../screens/welcome/welcome_screen.dart';
import 'package:pr20221029/screens/login/login_screen.dart';
import 'package:pr20221029/screens/create/add_question_book_popup.dart';


class AppRoutes {
  static List<GetPage> routes() =>
      [
        GetPage(name: "/", page: () => googleLoginPage()), //登入頁 login_screen.dart
        //GetPage(name: "/", page: () =>radioTest()), //?沒先登入的話抓不到帳號圖片會error => 1121已解
        //GetPage(name: "/introduction", page: () => SplashScreen())
        //GetPage(name: "/home", page: () => Home()) //在home1_screen.dart
      ];
}


