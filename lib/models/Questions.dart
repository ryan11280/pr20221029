class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "測試一",
    "options": ['答案一', '答案二', '答案三', '答案四'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "測試二.",
    "options": ['答案二之一', '答案二之二', '答案二之三', '答案二之四'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "測試三",
    "options": ['3-1', '3-2', '3-3', '3-4'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "測試四",
    "options": ['4-1', '4-2', '4-3', '4-4'],
    "answer_index": 2,
  },
];

