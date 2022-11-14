

class questionModel {
  List<Questions>? questions;

  questionModel({this.questions});

  questionModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? question;
  List<String>? answers;
  int? correctIndex;

  Questions({this.question, this.answers, this.correctIndex});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'].cast<String>();
    correctIndex = json['correctIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answers'] = this.answers;
    data['correctIndex'] = this.correctIndex;
    return data;
  }
}
