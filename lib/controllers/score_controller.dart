import 'package:get/get.dart';
//getX全域變數傳值

class ScoreController extends GetxController {
  final _score = 0.obs; //分數
  final _numOfCorrect = 0.obs; //答對題數
  final _numOfWrong = 0.obs; //答錯題數
  final _quizList = [].obs; //當次考題清單

  int get score => _score.value;

  int get numOfCorrect => _numOfCorrect.value;

  int get numOfWrong => _numOfWrong.value;

  List get quizList => _quizList.value;

  void updateScore(int value) {
    _score.value = value;
  }

  void updateNumOfCorrect(int value) {
    _numOfCorrect.value = value;
  }

  void updateNumOfWrong(int value) {
    _numOfWrong.value = value;
  }

  void updateQuizList(List value) {
    _quizList.value = value;
  }
}
