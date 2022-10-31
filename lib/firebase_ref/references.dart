import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionePaperRF = fireStore.collection('questionPaper');

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionePaperRF.doc(paperId).collection('questions').doc(questionId);
