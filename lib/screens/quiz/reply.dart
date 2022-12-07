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
  List<FsQuestionList> quiz = []; //當次考題
  late int quizLimit;  //一次考幾題
  int quizIndex = 0; //目前考到第幾題
  int score = 0; //分數
  //建立0 ~ itemCount的隨機整數index
  List<int> randomIndex = List<int>.generate(10, (i) => i)..shuffle();

  //int quizCount = 0;
  //create a global variable
  final Global global = Get.put(Global()); //全域變數

  @override
  initState() {
    super.initState();
    quizLimit = 3;  //一次考幾題
    quizIndex = 0; //目前考到第幾題
    //畫面load後動作
    //print("reply initState載入");
    var questionListLength = FsCheckQuestionsNumber();
    print("已答題數: ${global.quizCount.value}");
    refreshQuestion();
  }

  //下題刷新題目
  void refreshQuestion2() {
    setState(() {
      questionForShow = quiz.last.question;
      addTimeForShow = quiz.last.addTime;
      answer1ForShow = quiz.last.answer1;
      answer2ForShow = quiz.last.answer2;
      answer3ForShow = quiz.last.answer3;
      answer4ForShow = quiz.last.answer4;
      correctAnswerForShow = quiz.last.correctAnswer;
      //移除當前題目
      quiz.removeLast();
    });
  }

  //首次刷新題目
  void refreshQuestion() {
    fetchFsQuestionList().then((value) {
      setState(() {
        FsQuestionListFetch = []; //clear the list
        quiz.addAll(value);
        quiz.shuffle(); //隨機排序
        print("quiz.length = ${quiz.length}");
        //將考題抽入quiz list
        /*
        for (int i = 0; i < itemCount; i++) {
          var randomIndex =
              Random().nextInt(FsQuestionListFetch.length); //隨機取得一個index
          quiz.add(FsQuestionListFetch[randomIndex]);//將隨機取得的index的值加入quiz
          FsQuestionListFetch.removeAt(randomIndex); //將已經抽過的題目從FsQuestionListFetch移除
        }
        */

        //FsQuestionListFetch.sort((a, b) => a.addTime.compareTo(b.addTime));
        questionForShow = quiz[randomIndex.last].question;
        addTimeForShow = quiz[randomIndex.last].addTime;
        answer1ForShow = quiz[randomIndex.last].answer1;
        answer2ForShow = quiz[randomIndex.last].answer2;
        answer3ForShow = quiz[randomIndex.last].answer3;
        answer4ForShow = quiz[randomIndex.last].answer4;
        correctAnswerForShow = quiz[randomIndex.last].correctAnswer;
        quiz.removeLast(); //移除題目
      });
    });
  }

  void ifAnswered() {
    //暫停1秒後重新載入頁面
    Future.delayed(Duration(seconds: 1), () {
      //檢查是否作答完畢
      if (quizIndex < quizLimit) {
        refreshQuestion2();
        //print("第 ${quizIndex} 題結束,載入下一題...");
        //選項顏色回復
        defaultAnswer1Color = Colors.white;
        defaultAnswer2Color = Colors.white;
        defaultAnswer3Color = Colors.white;
        defaultAnswer4Color = Colors.white;
      } else {
        //測驗結束 轉 成績頁面
        print("--------測驗結束 成績: $score----------");
        //轉到score頁面
        Get.offAll(() => scorefomal(score: score));
      }
    });
  }

  //controllerList for 文字顯示控制
  //final controllerList = List.generate(5, (index) => TextEditingController());
  List<FsQuestionList> FsQuestionListFetch = []; //Fs上取下來的 FsQuestionListFetch
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
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            print("第 ${quizIndex+1} 題作答結果 => 選了: $answer1ForShow, 正確答案: $correctAnswerForShow, 答對與否: ${answer1ForShow == correctAnswerForShow}");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer1ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer1Color = Colors.lightGreenAccent;
                              });
                              score = score + 10;
                              quizIndex++;
                              ifAnswered();

                            } else {
                              setState(() {
                                defaultAnswer1Color = Colors.redAccent;
                              });
                              //score = score - 10;
                              quizIndex++;
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
                            print("第 ${quizIndex+1} 題作答結果 => 選了: $answer2ForShow, 正確答案: $correctAnswerForShow, 答對與否: ${answer2ForShow == correctAnswerForShow}");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer2ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer2Color = Colors.lightGreenAccent;
                              });
                              score = score + 10;
                              quizIndex++;
                              ifAnswered();
                            } else {
                              setState(() {
                                defaultAnswer2Color = Colors.redAccent;
                              });
                              //score = score - 10;
                              quizIndex++;
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
                            print("第 ${quizIndex+1} 題作答結果 => 選了: $answer3ForShow, 正確答案: $correctAnswerForShow, 答對與否: ${answer3ForShow == correctAnswerForShow}");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer3ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer3Color = Colors.lightGreenAccent;
                              });
                              score = score + 10;
                              quizIndex++;
                              ifAnswered();
                            } else {
                              setState(() {
                                defaultAnswer3Color = Colors.redAccent;
                              });
                              //score = score - 10;
                              quizIndex++;
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
                            print("第 ${quizIndex+1} 題作答結果 => 選了: $answer4ForShow, 正確答案: $correctAnswerForShow, 答對與否: ${answer4ForShow == correctAnswerForShow}");
                            //correctAnswer是數字, 無法與實際選項對應...
                            if (answer4ForShow == correctAnswerForShow) {
                              setState(() {
                                defaultAnswer4Color = Colors.lightGreenAccent;
                              });
                              score = score + 10;
                              quizIndex++;
                              ifAnswered();
                            } else {
                              setState(() {
                                defaultAnswer4Color = Colors.redAccent;
                              });
                              //score = score - 10;
                              quizIndex++;
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
                          child: const Text('跳過'),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "跳過此題",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            quizIndex++;
                            ifAnswered();
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
                                          Get.offAll(() => scorefomal(score: score,));
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
