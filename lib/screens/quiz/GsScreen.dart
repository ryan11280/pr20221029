import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pr20221029/configs/configs.dart';
import '../../models/GsModel.dart';
import '../../services/GsService.dart';

List<GsQuestionSheets> GsQuestionListNew = []; //依model建立空list 放外面working!

//介面區
class GsGoogleSheetData extends StatefulWidget {
  @override
  LoadDataFromGoogleSheetState createState() => LoadDataFromGoogleSheetState();
}

class LoadDataFromGoogleSheetState extends State<GsGoogleSheetData> {
  GsQuestionSheets? events;

  //List<Color> _colorCollection = <Color>[]; //自設顏色
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Container(
        child: FutureBuilder(
          future: GsGetDataFromGoogleSheet(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //End
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                //Done
                return SafeArea(
                  child: Container(
                    child: ListView.builder(
                      itemCount: GsQuestionListNew.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            //dense: true,
                            trailing: const Icon(Icons.arrow_forward_ios),
                            title: Text(
                                "Q${GsQuestionListNew[index].id}: ${GsQuestionListNew[index].questionName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text("選項一：${GsQuestionListNew[index].answer1}"),
                                Text("選項二：${GsQuestionListNew[index].answer2}"),
                                Text("選項三：${GsQuestionListNew[index].answer3}"),
                                Text("選項四：${GsQuestionListNew[index].answer4}"),
                                const SizedBox(height: 3),
                                Text("正確答案：${GsQuestionListNew[index].correctAnswer}"),
                                Text("加入時間：${kDatetimeFormat.format(DateTime.parse(GsQuestionListNew[index].addTime))}"),

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
              //loading
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ))),
    );
  }
}
