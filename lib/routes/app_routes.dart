import '../screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() =>
      [
        GetPage(name: "/", page: () => SplashScreen()) //預設首頁
        //GetPage(name: "/introduction", page: () => SplashScreen())

      ];
}


