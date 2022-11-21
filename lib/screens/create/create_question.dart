//overflow......
//To introduce a Material widget,
// you can either directly include one,
// or use a widget that contains Material itself,
// such as a Card, Dialog, Drawer, or Scaffold.
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pr20221029/screens/create/import_csv_screen.dart';
import 'package:pr20221029/services/FsService.dart';
import '../../configs/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:pr20221029/screens/home/home1_screen.dart';

class radioTest extends StatelessWidget {
  const radioTest({super.key}); //未知

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

enum SelectedEditAnswer { answer1, answer2, answer3, answer4 }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SelectedEditAnswer? _selectedEditAnswer = SelectedEditAnswer.answer1; //預設選項一
  final controllerList = List.generate(6, (index) => TextEditingController());
  dynamic question = "", answer1="", answer2="", answer3="", answer4="", correctAnswer;

  @override
  Widget build(BuildContext context) {
    //_checkLoaded(); //確認視窗載入後再彈窗,之後可改
    //會卡 先刪掉 //先彈窗 https://stackoverflow.com/questions/52164369/show-alert-dialog-on-app-main-screen-load-automatically-in-flutter
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
                //題目區
                Container(
                  child: Column(
                    children: [
                      Text("Your question",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      TextField(
                        controller: controllerList[0],
                        onChanged: (value) {
                          question = controllerList[0].text.toString();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '請輸入題目',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //選項區
                Container(
                  child: Column(
                    children: [
                      Text("Your answers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      ListTile(
                        title: TextField(
                          controller: controllerList[1],
                          onChanged: (value) {
                            answer1 = controllerList[1].text.toString();
                          },
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項一',
                          ),
                        ),
                        leading: Radio<SelectedEditAnswer>(
                          value: SelectedEditAnswer.answer1,
                          groupValue: _selectedEditAnswer,
                          onChanged: (value) {
                            setState(() {
                              _selectedEditAnswer = value;
                              correctAnswer = controllerList[1].text.toString();
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: TextField(
                          controller: controllerList[2],
                          onChanged: (value) {
                            answer2 = controllerList[2].text.toString();
                          },
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項二',
                          ),
                        ),
                        leading: Radio<SelectedEditAnswer>(
                          value: SelectedEditAnswer.answer2,
                          groupValue: _selectedEditAnswer,
                          onChanged: (SelectedEditAnswer? value) {
                            setState(() {
                              _selectedEditAnswer = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: TextField(
                          controller: controllerList[3],
                          onChanged: (value) {
                            answer3 = controllerList[3].text.toString();
                          },
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項三',
                          ),
                        ),
                        leading: Radio<SelectedEditAnswer>(
                          value: SelectedEditAnswer.answer3,
                          groupValue: _selectedEditAnswer,
                          onChanged: (SelectedEditAnswer? value) {
                            setState(() {
                              _selectedEditAnswer = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: TextField(
                          controller: controllerList[4],
                          onChanged: (value) {
                            answer4 = controllerList[4].text.toString();
                          },
                          maxLines: 1,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '請輸入選項四',
                          ),
                        ),
                        leading: Radio<SelectedEditAnswer>(
                          value: SelectedEditAnswer.answer4,
                          groupValue: _selectedEditAnswer,
                          onChanged: (SelectedEditAnswer? value) {
                            setState(() {
                              _selectedEditAnswer = value;
                              print(value);
                              correctAnswer = _selectedEditAnswer;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //按鈕區
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "重新載入本頁面",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Get.offAll(() => radioTest());
                        },
                        child: const Text('重新輸入'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //沒填完不給傳
                          if (question == "" ||
                              answer1 == "" ||
                              answer2 == "" ||
                              answer3 == "" ||
                              answer4 == "" ||
                              correctAnswer == "") {
                            Fluttertoast.showToast(
                                msg: "內容填寫不完整, 不給過。",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Fluttertoast.showToast(
                                msg: "送上firebase",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            correctAnswer = _selectedEditAnswer.toString();
                            print(
                                "輸入的題目是$question, 選項是 $answer1,$answer2,$answer3,$answer4, 正確答案是$correctAnswer");
                            await FsCreateQuestion(
                                question: question,
                                answer1: answer1,
                                answer2: answer2,
                                answer3: answer3,
                                answer4: answer4,
                                correctAnswer: correctAnswer);
                            Fluttertoast.showToast(
                                msg: "題目上傳成功",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.greenAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Get.offAll(() => radioTest());
                          }
                        },
                        child: const Text('送上Fs'),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Fluttertoast.showToast(
                            msg: "跳轉至讀入CSV頁",
                          );
                          Get.offAll(() => importCsvScreen());
                        },
                        child: const Text('Gs匯入csv'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var questionListLength =
                          await FsCheckQuestionsNumber();
                          //check questionList is empty or not
                          if (questionListLength == 0) {
                            Fluttertoast.showToast(
                                msg: "Fs題庫是空的, 請先上傳或匯入題目",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Fluttertoast.showToast(
                                msg: "目前Fs上有$questionListLength個題目",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Get.offAll(() => radioTest());
                          }
                        },
                        child: const Text('查Fs題數'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FsDeleteCollection();
                          Fluttertoast.showToast(
                            msg: "清空Fs上的題目",
                          );
                        },
                        child: const Text('清空Fs'),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //載入後彈窗
}
