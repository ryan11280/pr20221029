import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/controllers/question_controller.dart';
import '../../configs/themes/app_colors.dart';
import '../create/create_question.dart';
import '../home/home1_screen.dart';
import 'components/body.dart';


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
              padding: const EdgeInsets.only(right:25.0),
              child: IconButton(
                icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size:30.0
                ),
                onPressed: () {
                  Get.offAll(()=>Home());
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
                      height: 50,
                    ),
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextField(
                        maxLines: 12,
                        minLines: 8,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),

                        ),
                      ),
                    ),
                    Container(),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),


                //中間選擇區
                Container(
                  height: 60,
                  width: 430,

                  child:
                  Card(child: Text('11111')),

                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: 430,
                  child:
                  const Card(child: Text('11111')
                  ),

                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: 430,
                  child:
                  Card(child: Text('11111')),

                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: 430,
                  child:
                  Card(child: Text('11111')),

                ),
                SizedBox(
                  height: 30,
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
                          primary: kBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 15, // <-- SEE HERE
                      ),
                      OutlinedButton(
                        child: Text('完成'),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black87,
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
