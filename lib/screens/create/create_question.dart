import 'package:flutter/material.dart';
//等用看看listView

class createQuestion extends StatelessWidget {
  const createQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            Text("Create Question"),
            SizedBox(height: 50,),
            Container(
              child: Column(
                mainAxisSize:MainAxisSize.min,
                children: [
                Row(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                  Radio(value: "123", groupValue: "123", onChanged: null),
                  SizedBox(width: 10,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Question',
                    ),
                  ),
                ],
                )
              ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
