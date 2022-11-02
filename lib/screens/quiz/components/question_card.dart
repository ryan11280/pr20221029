import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import 'package:pr20221029/models/Questions.dart';
import 'package:pr20221029/configs/themes/app_colors.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
     Key? key,
    // it means we have to pass this
    required this.question, //@@@
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
