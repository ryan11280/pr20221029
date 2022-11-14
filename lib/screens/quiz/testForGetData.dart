//https://www.syncfusion.com/kb/12826/how-to-get-the-data-from-google-sheet-and-load-it-to-the-flutter-calendar-sfcalendar
//Google sheets測試
import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pr20221029/screens/questionlist/question_list.dart';
import 'package:pr20221029/services/googleSheetsGetData.dart';


final List<QuestionSheets> questionListNew = []; //依model建立空list 放外面working!

//介面區
class GoogleSheetData extends StatefulWidget {
  @override
  LoadDataFromGoogleSheetState createState() => LoadDataFromGoogleSheetState();
}

class LoadDataFromGoogleSheetState extends State<GoogleSheetData> {
  QuestionSheets? events;
  //List<Color> _colorCollection = <Color>[]; //自設顏色



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Container(
        child: FutureBuilder(future: getDataFromGoogleSheet(),builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return SafeArea(
                child: Container(
                  child: ListView.builder(
                    itemCount: questionListNew.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("Q: ${questionListNew[index].questionName}"),
                          subtitle: Column(
                            children: [
                              Text("選項一：${questionListNew[index].answer1}"),
                              Text("選項二：${questionListNew[index].answer2}"),
                              Text("選項三：${questionListNew[index].answer3}"),
                              Text("選項四：${questionListNew[index].answer4}"),
                            ],
                          ),

                        ),
                      );
                    },
                  ),
                ),
              ); //"Contents: ${snapshot.data}"
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },),
      ))),
    );
  }
}
/*
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}
*/

//model
class QuestionSheets {
  QuestionSheets(
      {required this.id,
      required this.addTime,
      required this.questionName,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4,
      required this.correctAnswer});

  int id;
  String addTime; //暫改string
  String questionName;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  int correctAnswer;
}
