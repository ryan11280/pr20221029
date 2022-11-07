import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          OutlinedButton(onPressed: _controller.nextQuestion, child: Text("略過")),
        ],
      ),
      body: Body(key: null,),
    );
  }
}