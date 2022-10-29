import 'package:flutter/material.dart';
import 'package:pr20221029/controllers/question_papers/data_uploader.dart';
import 'package:get/get.dart';
//import 'flutter/src/foundation/key.dart';
//import 'flutter/src/foundation/framework.dart';




class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("uploading..."),
      ),
    );
  }
}
