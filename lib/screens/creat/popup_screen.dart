import 'package:flutter/material.dart';
import'package:pr20221029/configs/themes/app_colors.dart';

void main() => runApp(const MyApp01());

class MyApp01 extends StatelessWidget {
  const MyApp01({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = '製 作 題 目';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kGrayColor,
          title: const Text(appTitle),
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
                  // do something
                },
              ),
            )
          ],

        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),


          child: TextField(

            maxLines:6,
            minLines:6,

            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(

                borderRadius: BorderRadius.horizontal(

                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),

              ),
              hintText: '輸入您的題目...',
            ),

          ),

        ),

      ],
    );
  }

}


