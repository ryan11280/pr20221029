import 'package:flutter/material.dart';
import 'package:xen_popup_card/xen_card.dart';
import '../home/home1_screen.dart';
import 'package:get/get.dart';

//showdialog
Future<void> popupDialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Title'),
        content: const Text('Content.......'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('回首頁'),
            onPressed: () {
              //Navigator.of(context).pop();
              Get.offAll(() => Home());
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('確定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}