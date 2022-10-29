import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'dart:core';

class DataUploader extends GetxController {
  @override
  //首次啟動載入一次
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    print("Data is uploading");
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    print(papersInAssets); //這邊不出來...結果是yaml沒對齊...done
    //先繼續...
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
    }
  }
}
