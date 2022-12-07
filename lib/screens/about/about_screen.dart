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
                          width: 300,
                          height: 300,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10,right:10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("聯絡資訊：\n\nEmail : ryan11280@gmail.com \n \n            jean890322@gmail.com\n\nTeL :    0966-603-526 ; 0912-223-223"),

                            SizedBox(height: 20,),
                            Text('''https://github.com/nyakaz73/Flutter-Footer //MIT //footer \nhttps://github.com/flutter/packages/tree/main/third_party/packages/cupertino_icons //MIT //Cupertino icons\nhttps://pub.dev/packages/firebase_core //firebase core //BSD-3-Clause\nhttps://pub.dev/packages/firebase_storage //firebase storage //BSD-3-Clause\nhttps://pub.dev/packages/google_fonts  // google fonts //Apache 2-.0\nhttps://pub.dev/packages/flutter_svg  //flutter svg //MIT\nhttps://pub.dev/packages/firebase_auth //firebase auth //BSD-3-Clause\nhttps://pub.dev/packages/google_sign_in   // google sign in //BSD-3-Clause\n https://pub.dev/packages/xen_popup_card  //xen popup card // MIT\nhttps://pub.dev/packages/http\n //http // BSD-3-Clause\nhttps://pub.dev/packages/fluttertoast   //flutte troast  //MIT\nhttps://pub.dev/packages/file_picker   //file picker // MIT\nhttps://pub.dev/packages/csv   //csv //MIT

                                '''),
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
                      'Powered by QA',
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
