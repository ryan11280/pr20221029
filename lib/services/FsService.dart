import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pr20221029/models/FsModel.dart';

//fetch data from firestore then return a FsQuestionList model list 1123
Future<List<FsQuestionList>> fetchFsQuestionList() async {
  print("執行讀題 fetchFsQuestionList...");
  await Firebase.initializeApp();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _questionCollection =
      _firestore.collection('questionListFirebase');
  final QuerySnapshot _querySnapshot = await _questionCollection.get();
  final List<FsQuestionList> FsQuestionListFetch = [];
  _querySnapshot.docs.forEach((doc) {
    FsQuestionListFetch.add(FsQuestionList.fromMap(doc.data()));
  });
  print('FsQuestionListFetch.length = ${FsQuestionListFetch.length}');
  return FsQuestionListFetch; //直接傳回model list
}

//fetch question from firestore as a list
Future<List> fetchQuestion() async {
  await Firebase.initializeApp();
  List questionList = [];
  QuerySnapshot questionSnapshot =
      await FirebaseFirestore.instance.collection('questionListFirebase').get();
  questionSnapshot.docs.forEach((element) {
    questionList.add(element.data());
  });
  print(questionList[0]['question']);
  return questionList;
}

// 不送model, 讀測試
//Read recently added questions
Future readRecentlyAddedQuestions() async {
  await Firebase.initializeApp();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _questionsCollectionReference =
      _firestore.collection('questionListFirebase');
  final QuerySnapshot _querySnapshot =
      await _questionsCollectionReference.get();
  final List<QueryDocumentSnapshot> FsQuestionsList = _querySnapshot.docs;
  FsQuestionsList.forEach((document) {
    //print(document.data());
  });
  //FsQuestionsList sort by addTime
  FsQuestionsList.sort((a, b) => b['addTime'].compareTo(a['addTime']));
  //print(FsQuestionsList[0]['questionName']);
  //print('Sevice端: 最新一題: ${FsQuestionsList.last.data()}');
  return FsQuestionsList;
}

//Delete Firebase collection
Future FsDeleteCollection() async {
  //String collectionName
  var collectionName = "questionListFirebase";
  await Firebase.initializeApp();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(collectionName);
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs.forEach((document) {
    document.reference.delete();
  });
  print("Fs集合: questionListFirebase 刪除完成");
}

//查詢目前在Firebase上的題目數量
Future FsCheckQuestionsNumber() async {
  print("執行FsCheckQuestionsNumber");
  await Firebase.initializeApp();
  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection('questionListFirebase');
  final QuerySnapshot questionSnapshot = await questionCollection.get();
  final List<DocumentSnapshot> questionDocuments = questionSnapshot.docs;
  int questionNumber = questionDocuments.length + 1;
  print("Fs題庫數量 = ${questionDocuments.length}");
  return questionDocuments.length;
}

//Create a new question to Firebase
Future FsCreateQuestion(
    {required String question,
    required String answer1,
    required String answer2,
    required String answer3,
    required String answer4,
    required correctAnswer}) async {
  print("進入FsCreateQuestion");
  await Firebase.initializeApp();
  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection('questionListFirebase');
  final QuerySnapshot questionSnapshot = await questionCollection.get();
  final List<DocumentSnapshot> questionDocuments = questionSnapshot.docs;
  print("Fs現有題庫數量：${questionDocuments.length}");
  //int questionNumber = questionDocuments.length + 1;
  var currentTime = DateTime.now();
  //print("現在新增 = $questionNumber");
  await questionCollection
      .add({
        'question': question,
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'answer4': answer4,
        'correctAnswer': correctAnswer,
        'addTime': currentTime, //依上傳時間自動產生
        //題本
        //'quizBook'
      })
      .then((value) => print("題目新增成功，id = ${value.id}"))
      .catchError((error) => print("Failed to add user: $error"));
}

/*
//Read all questions from Firebase
//建立一個新的題目至Firebase
Future SendQuestion({required String question, required String answer1, required String answer2, required String answer3, required String answer4, required correctAnswer}) async {
  FirebaseFirestore.instance.collection('questionListFirebase').get().then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      print(doc["id"]);
    }
  });
  //var questionListLength =  await FsCheckQuestionsNumber();
  final sendQuestion = FirebaseFirestore.instance.collection('questionListFirebase');
  final json = {
    'question': question,
    'answer1': answer1,
    'answer2': answer2,
    'answer3': answer3,
    'answer4': answer4,
    'correctAnswer': correctAnswer,
    'addTime': DateTime.now(),
  };
  await sendQuestion.add(json);
}*/
