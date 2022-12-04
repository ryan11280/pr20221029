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
  dynamic question = "",
      answer1 = "",
      answer2 = "",
      answer3 = "",
      answer4 = "",
      correctAnswer;

  @override
  Widget build(BuildContext context) {
    //_checkLoaded(); //確認視窗載入後再彈窗,之後可改
    //會卡 先刪掉 //先彈窗 https://stackoverflow.com/questions/52164369/show-alert-dialog-on-app-main-screen-load-automatically-in-flutter
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: const Text(
          '題目製作頁',
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("您的題目",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: TextField(
                          controller: controllerList[0],
                          onChanged: (value) {
                            question = controllerList[0].text.toString();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '請輸入題目',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                //選項區
                Container(
                  child: Column(
                    children: [
                      Text("您的選項",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
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
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
                          fixedSize: const Size(90, 30),
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: const BorderSide(width: 2, color: Colors.grey),
                        ),
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
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
                          fixedSize: const Size(90, 30),
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: const BorderSide(width: 2, color: Colors.grey),
                        ),
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
                        child: const Text('送上題庫'),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(90, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                          onPressed: () async {
                            Fluttertoast.showToast(
                              msg: "跳轉至讀入CSV頁",
                            );
                            Get.offAll(() => importCsvScreen());
                          },
                          child: const Text('匯入題目'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(90, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
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
                                  msg: "顯示目前題庫",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              var questionListAll = []; //暫存所有題目
                               await fetchFsQuestionList().then((value) {
                                setState(() {
                                  questionListAll = []; //clear the list
                                  questionListAll.addAll(value);
                                });
                              });
                              setupAlertDialoadContainer() {
                                return Container(
                                  height: 600.0,
                                  width: 300.0,
                                  child: ListView.builder(
                                    itemCount: int.tryParse(
                                        FsCheckQuestionsNumber().toString()),
                                    //題庫數量
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(
                                            "Q${index+1}: ${questionListAll[index].question}"),
                                      );
                                    },
                                  ),
                                );
                              };
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('目前題庫有 ${questionListAll.length} 題'),
                                      content: setupAlertDialoadContainer(),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('好的'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            }
                          },
                          child: const Text('題庫查詢'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(90, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                          onPressed: () async {
                            Fluttertoast.showToast(
                                msg: "清空Fs上的題目",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            FsDeleteCollection();
                            Fluttertoast.showToast(
                                msg: "Fs上的題目已清空",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.greenAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: const Text('清空題庫'),
                        ),
                      ]),
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
