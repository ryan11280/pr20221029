import 'package:cloud_firestore/cloud_firestore.dart';
//建立實體, 存取資料庫, 抓資料
class DatabaseService {
  final String? uid; //?
  DatabaseService({this.uid});
  FirebaseFirestore firebaseQuizDB = FirebaseFirestore.instance; //DB實體

  Future<void> addData(userData) async {
    firebaseQuizDB.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await firebaseQuizDB.collection("users").snapshots();
  }

  Future<void> addQuizData(Map quizData, String quizId) async {
    await firebaseQuizDB
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await firebaseQuizDB
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await firebaseQuizDB.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async{
    return await firebaseQuizDB
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }
}