//base on bialogy.json
//json to dart with null safety
//https://www.webinovers.com/web-tools/json-to-dart-convertor

class Answer {
  Answer({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.Description,
    required this.timeSeconds,
    required this.questions,
  });
  late final String id;
  late final String title;
  late final String imageUrl;
  late final String Description;
  late final int timeSeconds;
  late final List<Questions> questions;

  Answer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    imageUrl = json['image_url'];
    Description = json['Description'];
    timeSeconds = json['time_seconds'];
    questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['image_url'] = imageUrl;
    _data['Description'] = Description;
    _data['time_seconds'] = timeSeconds;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
  late final String id;
  late final String question;
  late final List<Answers> answers;
  late final String correctAnswer;

  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    question = json['question'];
    answers = List.from(json['answers']).map((e)=>Answers.fromJson(e)).toList();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['answers'] = answers.map((e)=>e.toJson()).toList();
    _data['correct_answer'] = correctAnswer;
    return _data;
  }
}

class Answers {
  Answers({
    required this.identifier,
    required this.Answer,
  });
  late final String identifier;
  late final String Answer;

  Answers.fromJson(Map<String, dynamic> json){
    identifier = json['identifier'];
    Answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['identifier'] = identifier;
    _data['Answer'] = Answer;
    return _data;
  }
}
