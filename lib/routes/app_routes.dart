import '../screens/splash_screen.dart';
import 'package:get/get.dart';
import '../screens/welcome/welcome_screen.dart';


class AppRoutes {
  static List<GetPage> routes() =>
      [
        GetPage(name: "/", page: () => WelcomeScreen()) //預設首頁
        //GetPage(name: "/introduction", page: () => SplashScreen())

      ];
}


