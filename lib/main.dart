import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pr20221029/firebase_options.dart';
import 'package:get/get.dart';
import 'data_uploader_screen.dart';
import 'firebase_options.dart';



Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home:DataUploaderScreen()));
}