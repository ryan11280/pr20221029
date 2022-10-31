import 'package:flutter/material.dart';
import 'package:pr20221029/controllers/question_papers/data_uploader.dart';
import 'package:get/get.dart';
import 'package:pr20221029/firebase_ref/loading_status.dart';

//import 'flutter/src/foundation/key.dart';
//import 'flutter/src/foundation/framework.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //const removed
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? "上傳完成！"
                : "上傳中...")),
      ),
    );
  }
}
