import 'package:flutter/material.dart';
import 'package:pr20221029/controllers/question_papers/question_paper_controller.dart';
import 'package:pr20221029/models/QuestionPaperModel.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required Key key}) : super(key: key); //required加

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            child: SizedBox(
              height: 200, width: 200,
              child: FadeInImage(
                image: NetworkImage(_questionPaperController.allPaperImage[index]),
                placeholder: AssetImage("assets/images/app_splash_logo.png"),
              ),
            ),
          );
          },
          separatorBuilder: (BuildContext context, int index){
            return const SizedBox(height: 20,);
          },
          itemCount: _questionPaperController.allPaperImage.length),
    );
  }
}
