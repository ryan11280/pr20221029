import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import '../../configs/themes/app_colors.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';
//vgbbnmjk
class reply extends StatefulWidget {
  const reply({Key? key}) : super(key: key);

  @override
  State<reply> createState() => _replyState();
}

class _replyState extends State<reply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('回答問題'),
        backgroundColor: kGrayColor,
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
      body: Material(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //上區
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextField(
                        maxLines: 12,
                        minLines: 7,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                //中間選擇區
                //第一格
                Container(
                  height: 70,
                  width: 350,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text('   A')),
                ),
                SizedBox(
                  height: 30,
                ),
//第二格
                Container(
                    height: 70,
                    width: 350,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('   B'))),
                SizedBox(
                  height: 30,
                ),
                //第三格
                Container(
                  height: 70,
                  width: 350,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text('   C')),
                ),
                SizedBox(
                  height: 30,
                ),
                //第四格
                Container(
                  height: 70,
                  width: 350,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text('   D')),

                ),
                SizedBox(
                  height: 20,
                ),

                //下面按鈕
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(

                        child: Text('下一題'),
                        onPressed: () {},

                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
                          fixedSize: Size(80, 30),
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: Colors.grey),

                        ),
                      ),
                      SizedBox(
                        width: 35, // <-- SEE HERE
                      ),
                      OutlinedButton(
                        child: Text('交卷'),

                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
                          fixedSize: Size(80, 30),
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: Colors.grey),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
