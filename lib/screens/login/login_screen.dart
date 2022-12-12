import 'package:flutter/material.dart';
import 'package:pr20221029/screens/home/home1_screen.dart';
import 'package:pr20221029/controllers/firebase_google_login_controller.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_light_theme.dart';

class googleLoginPage extends StatefulWidget {
  @override
  _googleLoginPageState createState() => _googleLoginPageState();
}

class _googleLoginPageState extends State<googleLoginPage> {
  get _authRepository => AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColorLight,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Image(image: AssetImage('assets/images/qalogo.png'))),
              SizedBox(height: 50),
              signInButton(),
              SizedBox(height: 30),
              guestButton(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget guestButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        //primary: Colors.amberAccent, //<-- SEE HERE
      ),
      onPressed: () async {
        print("訪客登入");
        Get.snackbar("訪客", "暫不跳轉",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        //Get.offAll(Home());
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // Image(image: AssetImage(""), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Guest',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signInButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        //primary: Colors.amberAccent, //<-- SEE HERE
      ),
      onPressed: () async {
        void loginSuccess() {
          print("登入成功！");
          Get.snackbar("登入成功", "歡迎光臨",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);
          Get.offAll(Home());
        }

        void loginFail() {
          print("登入失敗！");
          Get.snackbar("登入失敗", "請重新登入",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }

        await _authRepository.signInWithGoogle() == true
            ? loginSuccess()
            : loginFail();
        //await signInWithGoogle();
        /*
        signInWithGoogle().then((result) {
          if (result != null) {
            print('ok');
          }
        });*/
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // Image(image: AssetImage(""), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
