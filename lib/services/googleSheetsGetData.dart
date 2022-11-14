import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../screens/quiz/testForGetData.dart';
import 'dart:convert' as convert;


Future<List<QuestionSheets>> getDataFromGoogleSheet() async {
  //發送get request
  print("開始執行getDataFromGoogleSheet()");
  Response data = await http.get(
    Uri.parse(
        "https://script.google.com/macros/s/AKfycbyA2rLykARAnQqhM_u8xQgLlwtLno60dAtvsPFm9EB89pEw_4LO2m6uftYvzyyeRSFH/exec"),
  );
  dynamic jsonData = convert.jsonDecode(data.body); //json解碼
  //final Random random = Random(); //random??
  //迴圈將json內容對應存入questionList(List)
  for (dynamic data in jsonData) {
    QuestionSheets toQuestion = QuestionSheets(
        id: data['id'],
        addTime: data['addTime'],
        questionName: data['questionName'].toString(),
        answer1: data['answer1'].toString(),
        answer2: data['answer2'].toString(),
        answer3: data['answer3'].toString(),
        answer4: data['answer4'].toString(),
        correctAnswer: data['correctAnswer']);
    questionListNew.add(toQuestion);
  }
  print(jsonData[1]['questionName']);
  //print(questionList[0].questionName);
  return questionListNew;
}


//時間日期字串處理
DateTime _convertDateFromString(String date) {
  return DateTime.parse(date);
}