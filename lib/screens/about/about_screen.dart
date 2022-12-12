import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:flutter/material.dart';
import 'package:pr20221029/configs/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:pr20221029/screens/home/home1_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static Map<int, Color> color = {
    50: Color.fromRGBO(4, 131, 184, .1),
    100: Color.fromRGBO(4, 131, 184, .2),
    200: Color.fromRGBO(4, 131, 184, .3),
    300: Color.fromRGBO(4, 131, 184, .4),
    400: Color.fromRGBO(4, 131, 184, .5),
    500: Color.fromRGBO(4, 131, 184, .6),
    600: Color.fromRGBO(4, 131, 184, .7),
    700: Color.fromRGBO(4, 131, 184, .8),
    800: Color.fromRGBO(4, 131, 184, .9),
    900: Color.fromRGBO(4, 131, 184, 1),
  };

  //MaterialColor myColor = MaterialColor(0xFF162A49, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'footer',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF162A49, color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FooterPage(),
    );
  }
}

class FooterPage extends StatefulWidget {
  const FooterPage({super.key});

  @override
  FooterPageState createState() {
    return FooterPageState();
  }
}

class FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: const Text(
          '關於我們',
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.white, size: 30.0),
              onPressed: () {
                Get.offAll(() => Home());
                // do something
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FooterView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //show logo
                      Center(
                        child: Image.asset(
                          'assets/images/qalogo.png',
                          width: 200,
                          height: 200,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("版本資訊： v1.0\n更新日期：2022/12/12"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "聯絡資訊：\nEmail : ryan11280@gmail.com \n \n            jean890322@gmail.com\n\nTeL :    0987-654-321 ; 0912-223-223"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                '''References: \nhttps://github.com/nyakaz73/Flutter-Footer \nhttps://github.com/flutter/packages/tree/main/third_party/packages/cupertino_icons\nhttps://pub.dev/packages/firebase_core\nhttps://pub.dev/packages/firebase_storage\nhttps://pub.dev/packages/google_fonts\nhttps://pub.dev/packages/flutter_svg\nhttps://pub.dev/packages/firebase_auth\nhttps://pub.dev/packages/google_sign_in\nhttps://pub.dev/packages/http\nhttps://pub.dev/packages/fluttertoast\nhttps://pub.dev/packages/csv\nhttps://github.com/ZaynJarvis/Flutter-Sign-in-Button
                                '''),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "BSD-3-Clause License\n\nRedistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\n\n1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\n\n2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\n\n3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
            footer: Footer(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(),
                    Text(
                      'Copyright ©2022, All Rights Reserved.',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          color: Color(0xFF162A49)),
                    ),
                    Text(
                      'Powered by Quiz',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                          color: Color(0xFF162A49)),
                    ),
                  ]),
              padding: EdgeInsets.all(5.0),
            )),
      ),
    );
  }
}
