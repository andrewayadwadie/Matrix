import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionsDialog extends StatelessWidget {
  final String title;
  final String content;
  final String firstActionTitle;
  final String secondActionTitle;
  final Function firstActionFunction;
  final Function secondActionFunction;

  ActionsDialog(
      {@required this.title,
      @required this.content,
      @required this.firstActionTitle,
      @required this.secondActionTitle,
      @required this.firstActionFunction,
      @required this.secondActionFunction});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: Text(title),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        actionsOverflowButtonSpacing: 20,
        actions: [
          ElevatedButton(
              onPressed: firstActionFunction, child: Text(firstActionTitle)),
          ElevatedButton(
              onPressed: secondActionFunction, child: Text(secondActionTitle)),
        ],
        content: Text(content),
      );
    } else {
      return CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
              onPressed: firstActionFunction, child: Text(firstActionTitle)),
          CupertinoDialogAction(
              onPressed: secondActionFunction, child: Text(secondActionTitle)),
        ],
        content: Text(content),
      );
    }
  }
}
