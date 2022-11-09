//overflow測試中......
//To introduce a Material widget,
// you can either directly include one,
// or use a widget that contains Material itself,
// such as a Card, Dialog, Drawer, or Scaffold.

import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';
import 'add_question_book_popup.dart';
import 'package:get/get.dart';
import 'package:pr20221029/screens/home/home1_screen.dart';

class radioTest extends StatelessWidget {
  const radioTest({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    //會卡 先刪掉
    //先彈窗 https://stackoverflow.com/questions/52164369/show-alert-dialog-on-app-main-screen-load-automatically-in-flutter
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: const Text(
          '題目製作頁',
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
      body: Material(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //上區
                Container(
                  child: Text("show questions here.",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                SizedBox(
                  height: 30,
                ),
                //下區
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: const TextField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項一',
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const TextField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項二',
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const TextField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項三',
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const TextField(
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項四',
                          ),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
