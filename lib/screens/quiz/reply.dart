import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import 'package:pr20221029/screens/quiz/scoreformal.dart';
import '../../configs/themes/app_colors.dart';
import '../../models/FsModel.dart';
import '../../services/FsService.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';

class reply extends StatefulWidget {
  const reply({Key? key}) : super(key: key);

  @override
  State<reply> createState() => _replyState();
}

class _replyState extends State<reply> {
  @override
  initState() {
    super.initState();
    //畫面載入後動作
    //print("reply initState載入");
    var questionListLength = FsCheckQuestionsNumber();
    int itemCount = 3; //本次考題數量
    fetchFsQuestionList().then((value) {
      setState(() {
        FsQuestionListFetch = []; //clear the list
        FsQuestionListFetch.addAll(value);
        //FsQuestionsList sort by addTime
        FsQuestionListFetch.sort((a, b) => a.addTime.compareTo(b.addTime));
        FsQuestionListFetch.shuffle(); //打亂List, 因為直接測試顯示才放這
        questionForShow = FsQuestionListFetch.last.question;
        addTimeForShow = FsQuestionListFetch.last.addTime;
        answer1ForShow = FsQuestionListFetch.last.answer1;
        answer2ForShow = FsQuestionListFetch.last.answer2;
        answer3ForShow = FsQuestionListFetch.last.answer3;
        answer4ForShow = FsQuestionListFetch.last.answer4;
        correctAnswerForShow = FsQuestionListFetch.last.correctAnswer;
      });
    });
  }

  //controllerList for 文字顯示控制
  //final controllerList = List.generate(5, (index) => TextEditingController());
  List<FsQuestionList> FsQuestionListFetch = []; //Fs上取下來的
  List<FsQuestionList> QuestionListForTest = []; //本次考題
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
        title: const Text('回答問題'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //上區
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //remove const
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 60),
                      child: //display the question
                          Text(
                        "$questionForShow",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //中間選擇區
                //第一格
                Container(
                    height: 70,
                    width: 350,
                    child: Card(
                      color: defaultAnswer1Color,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          print("answer1ForShow: $answer1ForShow");
                          print("correctAnswerForShow: $correctAnswerForShow");
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
                          }
                        },
                        leading:
                            const Text('A', style: TextStyle(fontSize: 25)),
                        title: Text(answer1ForShow,
                            style: const TextStyle(fontSize: 25)),
                        //tileColor: Colors.green, //圓角超出...
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                //第二格
                Container(
                    height: 70,
                    width: 350,
                    child: Card(
                      color: defaultAnswer2Color,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          print("answer2ForShow: $answer2ForShow");
                          print("correctAnswerForShow: $correctAnswerForShow");
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
                          }
                        },
                        leading:
                            const Text('B', style: TextStyle(fontSize: 25)),
                        title: Text(answer2ForShow,
                            style: const TextStyle(fontSize: 25)),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                //第三格
                Container(
                    height: 70,
                    width: 350,
                    child: Card(
                      color: defaultAnswer3Color,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          print("answer3ForShow: $answer3ForShow");
                          print("correctAnswerForShow: $correctAnswerForShow");
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
                          }
                        },
                        leading:
                            const Text('C', style: TextStyle(fontSize: 25)),
                        title: Text(answer3ForShow,
                            style: const TextStyle(fontSize: 25)),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                //第四格
                Container(
                    height: 70,
                    width: 350,
                    child: Card(
                      color: defaultAnswer4Color,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          print("answer4ForShow: $answer4ForShow");
                          print("correctAnswerForShow: $correctAnswerForShow");
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
                          }
                        },
                        leading:
                            const Text('D', style: TextStyle(fontSize: 25)),
                        title: Text(
                          answer4ForShow,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),

                //下面按鈕
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        child: const Text('下一題'),
                        onPressed: () {
                          //go to next question
                          Get.offAll(() => const reply());
                        },
                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
                          fixedSize: const Size(80, 30),
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: const BorderSide(width: 2, color: Colors.grey),
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
                          side: const BorderSide(width: 2, color: Colors.grey),
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
                                height: 300.0, // Change as per your requirement
                                width: 300.0, // Change as per your requirement
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
                          side: const BorderSide(width: 2, color: Colors.grey),
                        ),
                      ),
                    ],
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
