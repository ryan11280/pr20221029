import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import '../../configs/themes/app_colors.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';

class scorefomal extends StatefulWidget {
  const scorefomal({Key? key}) : super(key: key);

  @override
  State<scorefomal> createState() => _scorefomalState();
}

class _scorefomalState extends State<scorefomal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分數'),
        backgroundColor: kGrayColor,
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
      backgroundColor: kGrayColor, //ojoj
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            height: 80,
            child: Card(
              color: kGrayColor,
              child: Text(
                ' Your Score :',
                style: TextStyle(fontSize: 30, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            alignment: Alignment.center,

              margin: EdgeInsets.all(50),
            child: Text("score here",
              style: TextStyle(fontSize:50 ),)

            ),
        ],
      ),
    );
  }
}
