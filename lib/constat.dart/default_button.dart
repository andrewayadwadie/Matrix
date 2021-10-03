import 'package:flutter/material.dart';

import 'package:matrix/constat.dart/colors.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String title;
  Function onTap;
  Color textColor;
  Color color;

  DefaultButton(
      {@required this.title, @required this.onTap, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color ?? primary,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
