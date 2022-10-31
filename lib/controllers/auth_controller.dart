import 'package:get/get.dart';

class AuthController extends GetxController{
  @override
  void onReady(){
    initAuth(); //先叫這個
    super.onReady();
  }

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2)); //延遲2s後再跳轉到Home?
    navigateToIntrodution(); //再來叫到這
  }

  void navigateToIntrodution(){
    Get.offAllNamed("/introduction"); //最後叫這
  }
}