class GsQuestionSheets {
  GsQuestionSheets(
      {required this.id,
        required this.addTime,
        required this.questionName,
        required this.answer1,
        required this.answer2,
        required this.answer3,
        required this.answer4,
        required this.correctAnswer});

  int id;
  String addTime; //暫改string
  String questionName;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  int correctAnswer;
}