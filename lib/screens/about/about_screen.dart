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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //show logo
                      Center(
                        child: Image.asset(
                          'assets/images/qalogo.png',
                          width: 280,
                          height: 220,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 70, right: 70),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [Text("Version:"), Text("1.0")],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Last update："),
                                      Text("Dec 12, 2022")
                                    ],
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Contact us：",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email :"),
                                Text(
                                    "   ryan11280@gmail.com\njean890322@gmail.com")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tel :"),
                                Text("0987-654-321\n0912-223-223")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Address :"),
                                Text(
                                    "55, Hwa-Kang Road, Yang-Ming-Shan\n                 Taipei , Taiwan 11114, R. O. C.",
                                    style: TextStyle(fontSize: 12))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Usages & References: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Enviroments:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Dart SDk 2.18.2\nFlutter SDK 3.3.4\nAndroid Studio 2021.3.1 Patch 1\nXcode 14.0.1\nCocoaPods version 1.11.3\nAndroid SDK version 30.0.3\nChrome 108.0.5359.98"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dart third-party dependencies: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '''https://github.com/nyakaz73/Flutter-Footer \nhttps://github.com/flutter/packages/tree/main/third_party/packages/cupertino_icons\nhttps://pub.dev/packages/firebase_core\nhttps://pub.dev/packages/firebase_storage\nhttps://pub.dev/packages/google_fonts\nhttps://pub.dev/packages/flutter_svg\nhttps://pub.dev/packages/firebase_auth\nhttps://pub.dev/packages/google_sign_in\nhttps://pub.dev/packages/http\nhttps://pub.dev/packages/fluttertoast\nhttps://pub.dev/packages/csv\nhttps://github.com/ZaynJarvis/Flutter-Sign-in-Button
                                ''',
                                style: TextStyle(fontSize: 13)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("License: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
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
                      'Powered by Quik Answer',
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
