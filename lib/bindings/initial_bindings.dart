import 'package:get/get.dart';
import 'package:pr20221029/controllers/auth_controller.dart';
import 'package:pr20221029/controllers/theme_controller.dart';
import '../screens/home/home1_screen.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true); //keep it stay in memory
    Get.put(Global(), permanent: true); //?全域變數
  }
}
