import 'dart:convert';

//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pr20221029/firebase_ref/loading_status.dart';
import 'package:pr20221029/firebase_ref/references.dart';
import 'package:pr20221029/models/QuestionPaperModel.dart';
//import 'dart:core';

class DataUploader extends GetxController {
  @override
  //首次啟動載入一次
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs; //載入狀態/obs for GetX

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0 狀態:載入
    final fireStore = FirebaseFirestore.instance;
    print("Data is uploading");
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    //print(papersInAssets); //這邊不出來...結果是yaml沒對齊...done
    List<QuestionPaperModel> questionPapers =
        []; //建立 空list 換成從QuestionPaperModel
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      //print(stringPaperContent);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print('目前題本數: ${questionPapers.length}'); //顯示題本數量
    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionePaperRF.doc(paper.id), {
        'title': paper.title,
        'image_url': paper.imageUrl,
        'Description': paper.description,
        'time_seconds': paper.timeSeconds,
        'questions_count':
            paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id!, questionId: questions.id!); //加!
        batch.set(questionPath, {
          'question': questions.question,
          //'answers': questions.answers,
          'correct_answer': questions.correctAnswer,
        });

        for (var answer in questions.answers!) {
          batch.set(questionPath.collection('answers').doc(answer.identifier), {
            "identifier": answer.identifier,
            "answer": answer.answer,
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed; //1 狀態:完成
    print("Data uploaded!");
  }
}
