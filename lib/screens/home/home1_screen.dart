import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr20221029/configs/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:pr20221029/screens/create/create_question.dart';
import 'package:pr20221029/screens/quiz/reply.dart';
import 'package:xen_popup_card/xen_card.dart';
import '../about/about_screen.dart';
import '../login/login_screen.dart';

void main() => runApp(MaterialApp());

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC1C1C1),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 40,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome!",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xFF101012),
                              fontSize: 14,
                              fontWeight: FontWeight.w200)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //FirebaseAuth.instance.currentUser!.displayName!
                    Row(
                      children: [
                        //檢查登入資訊，避免無法取得圖片錯誤1121
                        if(FirebaseAuth.instance.currentUser!.photoURL != null)
                          CircleAvatar(
                            backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                            radius: 30,
                          )
                        else(
                          const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person),
                          )
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //check displayName is null or not 1121
                              FirebaseAuth.instance.currentUser!.displayName != null ? FirebaseAuth.instance.currentUser!.displayName! : "No Name",
                              style: GoogleFonts.alice(
                                  textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  )),
                            ),
                            Text(
                              //check email is null or not 1121
                              FirebaseAuth.instance.currentUser!.email != null ? FirebaseAuth.instance.currentUser!.email! : "No Email",
                              style: GoogleFonts.alice(
                                  textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    icon: const Icon(Icons.logout, size: 40),
                    onPressed: () {
                      print("按下: 返回登入頁");
                      Get.offAll(()=>googleLoginPage());
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

class GridDashboard extends StatelessWidget {
  Items item1 =
  Items(title: "開始\n測驗",
      subtitle: "Start",
      event: "",
      img: ""

  );

  Items item2 = Items(
    title: "製作\n題目",
    subtitle: "Create",
    event: "",
    img: "",
  );
  Items item3 = Items(
    title: "測驗\n紀錄",
    subtitle: "Record",
    event: "",
    img: "",
  );
  Items item4 = Items(
    title: "關於\n我們",
    subtitle: "About",
    event: "",
    img: "",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
    ];

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Material(
              child: InkWell(
                onTap: (){
                  print("${data.title} 已被按下！");
                  //Get.offAll(page) //跳轉應放於後面
                  //個別頁面跳轉 by 1108加班
                  if(data.title == "開始\n測驗"){
                    Get.offAll(()=>reply());
                  }
                  else if(data.title == "製作\n題目"){
                    Get.offAll(()=>radioTest());
                  }
                  else if(data.title == "測驗\n紀錄"){
                    //Get.offAll(()=>Main2());
                  }
                  else if(data.title == "關於\n我們"){
                    Get.offAll(()=>FooterPage());
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kHomeButtonColor, borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title!,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: kHomekeyColor,
                              fontSize: 30,
                            )),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle!,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event!,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 11,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String? title;
  String? subtitle;
  String? event;
  String? img;

  Items({this.title, this.subtitle, this.event, this.img});
}