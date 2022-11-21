//JSON to Dart產生: https://javiercbk.github.io/json_to_dart/

class GsModel2 {
  int? id;
  String? addTime;
  String? questionName;
  int? answer1;
  int? answer2;
  int? answer3;
  int? answer4;
  int? correctAnswer;

  GsModel2(
      {this.id,
        this.addTime,
        this.questionName,
        this.answer1,
        this.answer2,
        this.answer3,
        this.answer4,
        this.correctAnswer});

  GsModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addTime = json['addTime'];
    questionName = json['questionName'];
    answer1 = json['answer1'];
    answer2 = json['answer2'];
    answer3 = json['answer3'];
    answer4 = json['answer4'];
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['addTime'] = this.addTime;
    data['questionName'] = this.questionName;
    data['answer1'] = this.answer1;
    data['answer2'] = this.answer2;
    data['answer3'] = this.answer3;
    data['answer4'] = this.answer4;
    data['correctAnswer'] = this.correctAnswer;
    return data;
  }
}
