//參考GsModel.dart
//用於Fs取下後對應

class FsQuestionList {
  FsQuestionList({required this.addTime,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.correctAnswer});

  String addTime;
  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String correctAnswer;


  //將Firebase取下來的資料對Model
  static FsQuestionList fromMap(Object? data) {
    final Map<String, dynamic> map = data as Map<String, dynamic>;
    return FsQuestionList(
        addTime: map['addTime'].toString(),
        question: map['question'],
        answer1: map['answer1'],
        answer2: map['answer2'],
        answer3: map['answer3'],
        answer4: map['answer4'],
        correctAnswer: map['correctAnswer']);
  }
}