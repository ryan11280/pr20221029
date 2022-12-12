import '../screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:pr20221029/screens/login/login_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/login", page: () => googleLoginPage()),
      ];
}
