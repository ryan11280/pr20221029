import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import 'package:pr20221029/controllers/score_controller.dart';
import 'package:pr20221029/screens/quiz/scoreformal.dart';
import '../../configs/themes/app_colors.dart';
import '../../models/FsModel.dart';
import '../../services/FsService.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';

class reply extends StatefulWidget {
  reply({Key? key}) : super(key: key);

  @override
  State<reply> createState() => _replyState();
}

class _replyState extends State<reply> {
  List<FsQuestionList>quiz = []; //當次考題
  int itemCount = 10; //該次考題庫
  int quizLimit = 3;
  //int quizCount = 0;
  //create a global variable
  final Global global = Get.put(Global()); //全域變數

  @override
  initState() {
    super.initState();
    //畫面load後動作
    //print("reply initState載入");
    var questionListLength = FsCheckQuestionsNumber();
    print("已答題數: ${global.quizCount.value}");
    refreshQuestion();
  }

  void refreshQuestion(){
    fetchFsQuestionList().then((value) {
      setState(() {
        FsQuestionListFetch = []; //clear the list
        FsQuestionListFetch.addAll(value);

        //將考題抽入quiz list
        for (int i = 0; i < itemCount; i++) {
          var randomIndex =
          Random().nextInt(FsQuestionListFetch.length); //隨機取得一個index
          quiz.add(FsQuestionListFetch[randomIndex]); //將隨機取得的index的值加入quiz
          FsQuestionListFetch.removeAt(
              randomIndex); //將隨機取得的index的值從FsQuestionListFetch移除
        }
        print("quiz.length = ${quiz.length}");

        //test
        //FsQuestionsList sort by addTime
        var randomIndex =
        Random().nextInt(FsQuestionListFetch.length); //隨機取得一個index
        //從0~9隨機取得一個int
        var randomInt = Random().nextInt(9);
        FsQuestionListFetch.sort((a, b) => a.addTime.compareTo(b.addTime));
        FsQuestionListFetch.shuffle(); //打亂List, 因為直接測試顯示才放這
        questionForShow = quiz[randomInt].question;
        addTimeForShow = quiz[randomInt].addTime;
        answer1ForShow = quiz[randomInt].answer1;
        answer2ForShow = quiz[randomInt].answer2;
        answer3ForShow = quiz[randomInt].answer3;
        answer4ForShow = quiz[randomInt].answer4;
        correctAnswerForShow = quiz[randomInt].correctAnswer;
      });
    });
  }

  void ifAnswered() {
    //暫停1秒後重新載入頁面
    Future.delayed(Duration(seconds: 1), () {
      Get.offAll(() => reply());
    });
  }

  //controllerList for 文字顯示控制
  //final controllerList = List.generate(5, (index) => TextEditingController());
  List<FsQuestionList> FsQuestionListFetch = []; //Fs上取下來的
  var questionForShow = "";
  var addTimeForShow = "";
  var answer1ForShow = "";
  var answer2ForShow = "";
  var answer3ForShow = "";
  var answer4ForShow = "";
  var correctAnswerForShow = "";
  var defaultAnswer1Color = Colors.white; //選項1預設顏色
  var defaultAnswer2Color = Colors.white; //選項2預設顏色
  var defaultAnswer3Color = Colors.white; //選項3預設顏色
  var defaultAnswer4Color = Colors.white; //選項4預設顏色

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('測驗'),
        backgroundColor: kGrayColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: const Icon(Icons.home, color: Colors.white, size: 30.0),
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
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              direction: Axis.vertical,
              children: <Widget>[
                //上區 => 3
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              questionForShow,
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //中間選項區
                //選項一 => 1
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 70,
                      width: 350,
                      child: Card(
                        color: defaultAnswer1Color,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () {
                            print("answer1ForShow: $answer1ForShow");
                            print(
                                "correctAnswerForShow: $correctAnswerForShow");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer1ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer1Color = Colors.lightGreenAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答對了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              global.quizCount.value++;
                              ifAnswered();

                            } else {
                              setState(() {
                                defaultAnswer1Color = Colors.redAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答錯了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              global.quizCount.value++;
                              ifAnswered();
                            }
                          },
                          leading:
                              const Text('A', style: TextStyle(fontSize: 25)),
                          title: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(answer1ForShow,
                                style: const TextStyle(fontSize: 25)),
                          ),
                          //tileColor: Colors.green, //圓角超出...
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                //選項二 => 1
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 70,
                      width: 350,
                      child: Card(
                        color: defaultAnswer2Color,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () {
                            print("answer2ForShow: $answer2ForShow");
                            print(
                                "correctAnswerForShow: $correctAnswerForShow");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer2ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer2Color = Colors.lightGreenAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答對了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                              ifAnswered();
                            } else {
                              setState(() {
                                defaultAnswer2Color = Colors.redAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答錯了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                              ifAnswered();
                            }
                          },
                          leading:
                              const Text('B', style: TextStyle(fontSize: 25)),
                          title: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(answer2ForShow,
                                style: const TextStyle(fontSize: 25)),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                //選項三 => 1
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 70,
                      width: 350,
                      child: Card(
                        color: defaultAnswer3Color,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () {
                            print("answer3ForShow: $answer3ForShow");
                            print(
                                "correctAnswerForShow: $correctAnswerForShow");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer3ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer3Color = Colors.lightGreenAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答對了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                              ifAnswered();
                            } else {
                              setState(() {
                                defaultAnswer3Color = Colors.redAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答錯了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                              ifAnswered();
                            }
                          },
                          leading:
                              const Text('C', style: TextStyle(fontSize: 25)),
                          title: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(answer3ForShow,
                                style: const TextStyle(fontSize: 25)),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                //選項四 => 1
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 70,
                      width: 350,
                      child: Card(
                        color: defaultAnswer4Color,
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () {
                            print("answer4ForShow: $answer4ForShow");
                            print(
                                "correctAnswerForShow: $correctAnswerForShow");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer4ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer4Color = Colors.lightGreenAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答對了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                            } else {
                              setState(() {
                                defaultAnswer4Color = Colors.redAccent;
                              });
                              Fluttertoast.showToast(
                                  msg: "答錯了",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              //quizCount++;
                              ifAnswered();
                            }
                          },
                          leading:
                              const Text('D', style: TextStyle(fontSize: 25)),
                          title: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              answer4ForShow,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      )),
                ),
                //下面按鈕 => 2
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          child: const Text('下一題'),
                          onPressed: () {
                            //go to next question
                            Get.offAll(() => reply());
                          },
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(80, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          width: 35, // <-- SEE HERE
                        ),
                        OutlinedButton(
                          child: const Text('交卷'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('確定要結束作答了嗎？'),
                                    //content: setupAlertDialoadContainer(),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('後悔了'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('交卷走人'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Get.offAll(() => const scorefomal());
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(80, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          width: 35, // <-- SEE HERE
                        ),
                        OutlinedButton(
                          child: const Text('抽題'),
                          onPressed: () async {
                            //check FsCheckQuestionsNumber 0?
                            var questionListLength =
                                await FsCheckQuestionsNumber();
                            int itemCount = 3; //本次考題數量
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
                              fetchFsQuestionList().then((value) {
                                setState(() {
                                  FsQuestionListFetch = []; //clear the list
                                  FsQuestionListFetch.addAll(value);
                                  //FsQuestionsList sort by addTime
                                  FsQuestionListFetch.sort(
                                      (a, b) => a.addTime.compareTo(b.addTime));
                                  questionForShow =
                                      FsQuestionListFetch.last.question;
                                  addTimeForShow =
                                      FsQuestionListFetch.last.addTime;
                                  answer1ForShow =
                                      FsQuestionListFetch.last.answer1;
                                  answer2ForShow =
                                      FsQuestionListFetch.last.answer2;
                                  answer3ForShow =
                                      FsQuestionListFetch.last.answer3;
                                  answer4ForShow =
                                      FsQuestionListFetch.last.answer4;
                                  correctAnswerForShow =
                                      FsQuestionListFetch.last.correctAnswer;
                                });
                              });
                              //顯示最後一題
                              print(
                                  "最近新增的一題: ${FsQuestionListFetch.last.question}");

                              setupAlertDialoadContainer() {
                                FsQuestionListFetch.shuffle(); //打亂List
                                return Container(
                                  height: 300.0,
                                  // Change as per your requirement
                                  width: 300.0,
                                  // Change as per your requirement
                                  child: ListView.builder(
                                    itemCount: itemCount,
                                    //FsQuestionListFetch.length
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(
                                            "Q${index + 1}: ${FsQuestionListFetch[index].question}"),
                                        subtitle: Text(
                                            FsQuestionListFetch[index].addTime),
                                      );
                                    },
                                  ),
                                );
                              }

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('從題庫抽了$itemCount題'),
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

                              Fluttertoast.showToast(
                                  msg: "顯示本次題目",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(80, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        OutlinedButton(
                          child: const Text('Test'),
                          onPressed: () async {
                            var questionListLength =
                                await FsCheckQuestionsNumber();
                            int itemCount = 3; //本次考題數量
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
                              //FsQuestionListFetch裡面有東西
                              fetchFsQuestionList().then((value) {
                                setState(() {
                                  FsQuestionListFetch =
                                      []; //clear the list first
                                  //FsQuestionListFetch add 5 questions from FsQuestionList
                                  FsQuestionListFetch.addAll(value);
                                  //random 3 questions from FsQuestionListFetch
                                  FsQuestionListFetch.shuffle();
                                  FsQuestionListFetch =
                                      FsQuestionListFetch.sublist(
                                          0, itemCount); //取指定題數
                                  //print test
                                  print(
                                      "FsQuestionListFetch: ${FsQuestionListFetch.length}");
                                  //print first question
                                  print(
                                      "第一題: ${FsQuestionListFetch[0].question}");
                                  //print second question
                                  print(
                                      "第二題: ${FsQuestionListFetch[1].question}");
                                  //print third question
                                  print(
                                      "第三題: ${FsQuestionListFetch[2].question}");
                                  //FsQuestionListFetch.addAll(value); //add new questions
                                  //sort by addTime
                                  //FsQuestionListFetch.sort(
                                  //(a, b) => a.addTime.compareTo(b.addTime));
                                  questionForShow =
                                      FsQuestionListFetch.last.question;
                                });
                              });
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            shadowColor: Colors.black87,
                            fixedSize: const Size(80, 30),
                            primary: kBlackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side:
                                const BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
