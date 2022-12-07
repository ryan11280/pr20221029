import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pr20221029/models/GsModel2.dart';
import 'package:pr20221029/screens/create/create_question.dart';
import 'package:get/get.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:pr20221029/services/GsService.dart';

import '../../configs/configs.dart';
import '../../configs/themes/app_colors.dart';
import '../../models/GsModel.dart';
import '../../services/FsService.dart';
import '../quiz/GsScreen.dart';

List<GsQuestionSheets> GsQuestionListImport =
    []; //共用model, 依model建立空list 放外面working!

class importCsvScreen extends StatefulWidget {
  const importCsvScreen({Key? key}) : super(key: key);

  @override
  State<importCsvScreen> createState() => _importCsvScreenState();
}

class _importCsvScreenState extends State<importCsvScreen> {
  GsQuestionSheets? events;
  dynamic url;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: Text('從Google試算表匯入題目'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded,
                  color: Colors.white, size: 30.0),
              onPressed: () {
                Get.offAll(() => radioTest());
                // do something
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text('依照格式建立Google試算表文件後\n'
                      '\n檔案=>共用=>發布到網路=>選擇csv格式=>將網址貼入下欄')),
            ),
            SizedBox(height: 15),
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller, //controller
                    onChanged: (value) {
                      url = controller.text.toString();
                      print("更新");
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '請填入試算表的CSV網址',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.black87,
                        fixedSize: const Size(100, 30),
                        primary: kBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: const BorderSide(width: 2, color: Colors.grey),
                      ),
                      onPressed: () async {
                        Fluttertoast.showToast(
                          msg: "匯入中...請稍候...",
                          toastLength: Toast.LENGTH_LONG,
                        );
                        print("用我的");
                        try {
                          //固定url
                          url =
                              'https://docs.google.com/spreadsheets/d/e/2PACX-1vQr0zMomaIB4k4Vypk1h1WtM8Er-PS7j5CL_eqvCD_vWGw_27CeWpu9uGMx-SIvTxkeyiVWGg1nslVG/pub?output=csv';
                          GsQuestionListImport = [];
                          GsQuestionListImport =
                              await csvToList(url.toString());
                          //用迴圈把每一題送上firebase
                          for (var i = 0;
                              i < GsQuestionListImport.length;
                              i++) {
                            //await Future.delayed(const Duration(milliseconds: 500));
                            await FsCreateQuestion(
                              question: GsQuestionListImport[i]
                                  .questionName
                                  .toString(),
                              answer1:
                                  GsQuestionListImport[i].answer1.toString(),
                              answer2:
                                  GsQuestionListImport[i].answer2.toString(),
                              answer3:
                                  GsQuestionListImport[i].answer3.toString(),
                              answer4:
                                  GsQuestionListImport[i].answer4.toString(),
                              correctAnswer: GsQuestionListImport[i]
                                  .correctAnswer
                                  .toString(),
                            );
                          }
                          Fluttertoast.showToast(
                            msg: "完成！本次新增了${GsQuestionListImport.length}題",
                          );
                          print("上傳完成！本次新增了${GsQuestionListImport.length}題");

                          //var result2 = await GsGetDataFromGoogleSheet();
                          //print("result: $result");
                          print(
                              "Screen端: 試算表上的題目數量: ${GsQuestionListImport.length}");
                          print(
                              "Screen端: 最新一題題目: ${GsQuestionListImport.last.questionName}");
                          print(
                              "Screen端: 最新一題新增時間: ${GsQuestionListImport.last.addTime}");
                          Fluttertoast.showToast(
                              msg: "完成!, 匯入了${GsQuestionListImport.length}個題目",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.black,
                              fontSize: 16.0);
                          setState(() {});
                        } catch (e) {
                          print("HTTP請求錯誤: $e");
                          Fluttertoast.showToast(
                              msg: "錯誤: $e",
                              toastLength: Toast.values[1],
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.grey,
                              fontSize: 16.0);
                        }
                      },
                      child: Text('範例題庫'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.black87,
                        fixedSize: const Size(100, 30),
                        primary: kBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: const BorderSide(width: 2, color: Colors.grey),
                      ),
                      onPressed: () async {
                        Fluttertoast.showToast(
                          msg: "匯入中...",
                        );
                        //url = controller.text.toString();
                        print("Screen輸入url: $url");
                        //https://stackoverflow.com/questions/64088655/create-csv-file-to-read-from-internet
                        try {
                          GsQuestionListImport =
                              await csvToList(url.toString()); //去var
                          //var result2 = await GsGetDataFromGoogleSheet();
                          //print("result: $result");
                          print(
                              "Screen端: 試算表上的題目數量: ${GsQuestionListImport.length}");
                          //print("Screen端: 最新一題題目: ${GsQuestionListImport.last.questionName}");
                          //print(
                          //"Screen端: 最新一題解答: 選項${GsQuestionListImport.last.correctAnswer}");
                          //print("Screen端: 最新一題新增時間: ${GsQuestionListImport.last.addTime}");
                          Fluttertoast.showToast(
                              msg:
                                  "完成!, 匯入了${GsQuestionListImport.length}個題目",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.black,
                              fontSize: 16.0);
                          setState(() {});
                        } catch (e) {
                          print("網路錯誤: $e, 請檢查網路連線");
                          Fluttertoast.showToast(
                              msg: "錯誤: $e",
                              toastLength: Toast.values[1],
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.red,
                              fontSize: 16.0);
                        }
                        //print("screen端 第2題解答: ${result.correctAnswer}");
                        //print("screen端 新增時間(格式化): ${kDatetimeFormat.format(DateTime.parse(result[1].addTime))}");
                      },
                      child: const Text('立即匯入'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.black87,
                        fixedSize: const Size(100, 30),
                        primary: kBlackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: const BorderSide(width: 2, color: Colors.grey),
                      ),
                      onPressed: () async {
                        Fluttertoast.showToast(
                          msg: "匯入中...請稍候...",
                        );
                        setState(() {}); //刷新頁面
                        print("上傳至Firebase");
                        //將題目上傳至firebase
                        print(
                            "GsQuestionListImport.length: ${GsQuestionListImport.length}");
                        for (var i = 0; i < GsQuestionListImport.length; i++) {
                          //await Future.delayed(const Duration(milliseconds: 500));
                          await FsCreateQuestion(
                            question:
                                GsQuestionListImport[i].questionName.toString(),
                            answer1: GsQuestionListImport[i].answer1.toString(),
                            answer2: GsQuestionListImport[i].answer2.toString(),
                            answer3: GsQuestionListImport[i].answer3.toString(),
                            answer4: GsQuestionListImport[i].answer4.toString(),
                            correctAnswer: GsQuestionListImport[i]
                                .correctAnswer
                                .toString(),
                          );
                        }
                        Fluttertoast.showToast(
                          msg: "Done！本次新增了${GsQuestionListImport.length}題",
                        );
                        print("上傳完成！本次新增了${GsQuestionListImport.length}題");
                      },
                      child: Text('傳上題庫'),
                    )
                  ],
                ),
                //Future這邊會報layouts ==== 待解
              ],
            )),
            SizedBox(height: 15),
            //顯示區
            Container(
              child: Flexible(
                child: FutureBuilder(
                  future: csvToList(url), //csvToList(url) 先不要？
                  builder: (BuildContext context,
                      AsyncSnapshot<List<GsQuestionSheets>> snapshot) {
                    //display GsQuestionListNew2 with listview
                    if (snapshot.hasData) {
                      GsQuestionListImport = []; //清空
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          //把question, answer1存到GsQuestionListImport上
                          GsQuestionListImport.add(snapshot.data![index]);
                          return Card(
                            child: ListTile(
                              onTap: ()async{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("${GsQuestionListImport[index].questionName}"
                                      ,maxLines: 4,
                                      overflow: TextOverflow.ellipsis,),
                                      content: Text("選項A: ${GsQuestionListImport[index].answer1}\n選項B: ${GsQuestionListImport[index].answer2}\n選項C: ${GsQuestionListImport[index].answer3}\n選項D: ${GsQuestionListImport[index].answer4}\n\n正確答案: ${GsQuestionListImport[index].correctAnswer}\n\n建立時間"
                                          ": ${GsQuestionListImport[index].addTime}", maxLines: 10, overflow: TextOverflow.ellipsis,),
                                      actions: [
                                      ],
                                    );
                                  },
                                );
                              },
                              title: Text(
                                  "${snapshot.data![index].questionName}",
                                  overflow: TextOverflow.ellipsis),
                              subtitle: Text(
                                  "Answer: ${snapshot.data![index].correctAnswer}",
                                  overflow: TextOverflow.ellipsis),
                              trailing: Text(snapshot.data![index].addTime,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.dstATop),
                            image: const NetworkImage(
                              'https://media3.giphy.com/media/lReVblhSRtxXtfK81w/giphy.gif?cid=ecf05e470s1wtww5sdbm4ve59kavcrih4zf671m6hz2mr4ny&rid=giphy.gif&ct=g',
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
