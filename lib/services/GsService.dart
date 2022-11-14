import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pr20221029/models/GsModel.dart';
import 'package:pr20221029/screens/quiz/GsScreen.dart';
import 'dart:convert' as convert;

Future<List<GsQuestionSheets>> GsGetDataFromGoogleSheet() async {
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
  print(jsonData[1]['questionName']);
  print(GsQuestionListNew.length);
  //print(questionList[0].questionName);
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
