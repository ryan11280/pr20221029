import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr20221029/configs/themes/app_colors.dart';
import 'package:get/get.dart';

import '../../main2.dart';
import '../login/login_screen.dart';

void main() => runApp(MaterialApp(home: Home()));

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
                      "主頁",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 28,
                              )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " Home",
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
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FirebaseAuth.instance.currentUser!.displayName!,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  )),
                            ),
                            Text(
                              FirebaseAuth.instance.currentUser!.email!,
                              style: GoogleFonts.openSans(
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
    subtitle: "Creat",
    event: "",
    img: "",
  );
  Items item3 = Items(
    title: "紀錄",
    subtitle: "Record",
    event: "",
    img: "",
  );
  Items item4 = Items(
    title: "關於",
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
            return Container(
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