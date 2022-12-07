import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import '../../configs/themes/app_colors.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';

class scorefomal extends StatefulWidget {
  final int? score;

  scorefomal({Key? key, this.score}) : super(key: key);

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

        ],
      ),
      backgroundColor: kGrayColor, //ojoj
      body: Column(
        children: [
          SizedBox(
            height: 100,
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
              child: Text(
                "${widget.score}",
                style: TextStyle(fontSize: 100),
              )),
          SizedBox(height: 100),
          OutlinedButton(
            child: const Text('回首頁',
                style: TextStyle(fontSize: 20),
                ),
            onPressed: () {
              Get.offAll(() => Home());
            },
            style: OutlinedButton.styleFrom(
              shadowColor: Colors.black87,
              fixedSize: const Size(130, 100),
              primary: kBlackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              side:
              const BorderSide(width: 2, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
