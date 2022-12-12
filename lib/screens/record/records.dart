//顯示測驗紀錄
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_colors.dart';
import '../home/home1_screen.dart';

class records2 extends StatefulWidget {
  const records2({Key? key}) : super(key: key);

  @override
  State<records2> createState() => _recordsState();
}

class _recordsState extends State<records2> {
  @override
  Widget build(BuildContext context) {
    //顯示測驗紀錄
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: const Text(
          '測驗紀錄',
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(Icons.home, color: Colors.white, size: 30.0),
              onPressed: () {
                Get.offAll(() => Home());
                // do something
              },
            ),
          )
        ],
      ),
      body: const Center(
        child:
            Text('顯示測驗紀錄', style: TextStyle(fontWeight: FontWeight.w200)),
      ),
    );
  }
}
