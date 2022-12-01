import 'dart:core';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pr20221029/models/GsModel.dart';
import 'package:pr20221029/screens/quiz/GsScreen.dart';
import 'dart:convert' as convert;

//CSV
Future<List<GsQuestionSheets>> csvToList(url) async {
  print("進csvToList");
  GsQuestionListNew2 = []; //清空list
  //url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vQr0zMomaIB4k4Vypk1h1WtM8Er-PS7j5CL_eqvCD_vWGw_27CeWpu9uGMx-SIvTxkeyiVWGg1nslVG/pub?gid=0&single=true&output=csv";
  print("csvToList函式 接收到的url: $url");
  dynamic csvfile;
  csvfile = await http.get(Uri.parse(url));
  //conver csv to list
  //List<List> listCreated =
  //final csvData = CsvToListConverter().convert(csvfile.body);
  final csvUtf8 = convert.utf8.decode(csvfile.bodyBytes); //先轉utf8才不會中文亂碼
  final csvData = CsvToListConverter().convert(csvUtf8);
  //print("\nlistCreated: $listCreated\n");
  //迴圈將csvData內容對應存入GsQuestionListNew2(List)

  for(var i=1; i< csvData.length; i++){
    GsQuestionListNew2.add(GsQuestionSheets(
      id: csvData[i][0].toString(),
      addTime: csvData[i][1].toString(),
      questionName: csvData[i][2].toString(),
      answer1: csvData[i][3].toString(),
      answer2: csvData[i][4].toString(),
      answer3: csvData[i][5].toString(),
      answer4: csvData[i][6].toString(),
      correctAnswer: csvData[i][7].toString(),
    ));
  };
  //print("Service端: csvData上目前有: ${csvData.length-1} 個題目");
  //print("csvData的0項: ${csvData[0]}");
  //[id, addTime, questionName, answer1, answer2, answer3, answer4, correctAnswer]
  //print("csvData的1項: ${csvData[1]}");
  //格式說明: csvData[題號][對上註解的項目]
  //print("Service端: 第一題 題目: ${csvData[1][2]}");
  //print("GsQuestionListNew2 = $GsQuestionListNew2");
  //print("Service端: GsQuestionListNew2題庫長度：${GsQuestionListNew2.length}");
  return GsQuestionListNew2;
}

Future<List<GsQuestionSheets>> GsGetDataFromGoogleSheet() async {
  print("開始執行getDataFromGoogleSheet()");
  GsQuestionListNew = []; //清空list
  Response data = await http.get(
    Uri.parse(
        "https://script.google.com/macros/s/AKfycbyA2rLykARAnQqhM_u8xQgLlwtLno60dAtvsPFm9EB89pEw_4LO2m6uftYvzyyeRSFH/exec"),
  );
  dynamic jsonData = convert.jsonDecode(data.body); //json解碼
  //final Random random = Random(); //random??
  //迴圈將json內容對應存入questionList(List)
  for (dynamic data in jsonData) {
    print("進迴圈");
    GsQuestionSheets toQuestion = GsQuestionSheets(
        id: data['id'],
        addTime: data['addTime'],
        questionName: data['questionName'].toString(),
        answer1: data['answer1'].toString(),
        answer2: data['answer2'].toString(),
        answer3: data['answer3'].toString(),
        answer4: data['answer4'].toString(),
        correctAnswer: data['correctAnswer']);
    GsQuestionListNew.add(toQuestion);
  }
  print("GsService端: 測試顯示 第一題題目：${GsQuestionListNew[0].questionName}");
  print(GsQuestionListNew.length);
  //print(questionList[0].questionName);
  return GsQuestionListNew;
}

Future<List<GsQuestionSheets>> GsStreamGetDataFromGoogleSheet() async {
  //發送get request
  print("開始執行getDataFromGoogleSheet()");
  GsQuestionListNew = []; //清空list
  Response data = await http.get(
    Uri.parse(
        "https://script.google.com/macros/s/AKfycbyA2rLykARAnQqhM_u8xQgLlwtLno60dAtvsPFm9EB89pEw_4LO2m6uftYvzyyeRSFH/exec"),
  );
  dynamic jsonData = convert.jsonDecode(data.body); //json解碼
  //final Random random = Random(); //random??
  //迴圈將json內容對應存入questionList(List)
  for (dynamic data in jsonData) {
    print("進迴圈");
    GsQuestionSheets toQuestion = GsQuestionSheets(
        id: data['id'],
        addTime: data['addTime'],
        questionName: data['questionName'].toString(),
        answer1: data['answer1'].toString(),
        answer2: data['answer2'].toString(),
        answer3: data['answer3'].toString(),
        answer4: data['answer4'].toString(),
        correctAnswer: data['correctAnswer']);
    GsQuestionListNew.add(toQuestion);
  }
  //print("jsondata[1]['questionName']: ${jsonData[1]['questionName']}");
  return GsQuestionListNew;
}

Stream<List<GsQuestionSheets>> GsStreamGetDataFromGoogleSheet2() async* {
  //發送get request
  print("開始執行getDataFromGoogleSheet()");
  GsQuestionListNew = []; //清空list
  Response data = await http.get(
    Uri.parse(
        "https://script.google.com/macros/s/AKfycbyA2rLykARAnQqhM_u8xQgLlwtLno60dAtvsPFm9EB89pEw_4LO2m6uftYvzyyeRSFH/exec"),
  );
  dynamic jsonData = convert.jsonDecode(data.body); //json解碼
  //final Random random = Random(); //random??
  //迴圈將json內容對應存入questionList(List)
  for (dynamic data in jsonData) {
    print("進迴圈");
    GsQuestionSheets toQuestion = GsQuestionSheets(
        id: data['id'],
        addTime: data['addTime'],
        questionName: data['questionName'].toString(),
        answer1: data['answer1'].toString(),
        answer2: data['answer2'].toString(),
        answer3: data['answer3'].toString(),
        answer4: data['answer4'].toString(),
        correctAnswer: data['correctAnswer']);
    GsQuestionListNew.add(toQuestion);
  }
  print(jsonData[1]['questionName']);
  print(GsQuestionListNew.length);
  //print(questionList[0].questionName);
  yield GsQuestionListNew;
}

//時間日期字串處理
DateTime GsConvertDateFromString(String date) {
  return DateTime.parse(date);
}
