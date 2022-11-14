import 'package:get/get.dart';
import 'package:pr20221029/controllers/auth_controller.dart';
import 'package:pr20221029/controllers/theme_controller.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(AuthController(), permanent: true); //keep it stay in memory
  }
}