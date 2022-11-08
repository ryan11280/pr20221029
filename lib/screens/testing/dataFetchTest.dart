//測試從Firestore抓資料下來...
//Layouts: https://tw-hkt.blogspot.com/2019/08/flutter-listview.html
//CRUD: https://medium.com/firebase-developers/firebase-firestore-crud-realtime-database-b476ca5f857c
//model???

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pr20221029/models/Questions.dart'; //model

class dataFetchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('dataFetchFromFirestoreTest'),
      ),
      body: dataFetchFromFirestoreTest(),
    ));
  }
}

class dataFetchFromFirestoreTest extends StatelessWidget {
  //Instantiate Firestore
  final db = FirebaseFirestore.instance;

  bookSession({name, service, time}) async {
    final docRef = db.collection('appointments').doc();
    Appointment appt =
        Appointment(name: name, time: time, service: service, id: docRef.id);

    // await docRef.set(appt.fromJson()).then(
    //       (value) => print("Appointment booked successfully!"),
    // onError: (e) => print("Error booking appointment: $e"));
  }

  //列表集合資料
  List<Widget> list = <Widget>[
    ListTile(
      title: Text(
        '測試標題一',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('測試內容一'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
    ListTile(
      title: Text(
        '測試標題二',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('測試內容二'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
    ListTile(
      title: Text(
        '測試標題三',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('測試內容三'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        children: list,
      ),
    );
  }
}

class Appointment {
  final String name;
  final DateTime time;
  final String service;
  final String id;

  Appointment(
      {required this.name,
      required this.time,
      required this.service,
      required this.id});
}
