//顯示測驗紀錄
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr20221029/configs/configs.dart';
import '../../configs/themes/app_colors.dart';
import '../../services/FsService.dart';
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
      body: Center(
          child: Column(
        children: [
          Container(
            child: Flexible(
              child: FutureBuilder<List>(
                future: FsFetchRecords(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(snapshot.data![index]['score'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200, fontSize: 30),
                                  overflow: TextOverflow.ellipsis),
                              subtitle: Text(
                                  "From: ${snapshot.data![index]['userName'].toString()}",
                                  overflow: TextOverflow.ellipsis),
                              trailing: Text(
                                  kDatetimeFormat.format(DateTime.parse(snapshot.data![index]['time'].toString())),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
