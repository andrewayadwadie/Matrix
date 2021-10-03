import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';

class HomeTitle extends StatelessWidget {
  final String iconName;
  final String title;

  const HomeTitle({@required this.iconName, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: translator.currentLanguage == 'ar'
              ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
              : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
          width: MediaQuery.of(context).size.width / 13,
          height: MediaQuery.of(context).size.height / 25,
          child: Image.asset(
            'assets/icons/$iconName',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "$title",
                style: TextStyle(color: secondary, fontSize: 15),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: translator.currentLanguage == 'en'
                      ? EdgeInsets.only(left: 20, right: 5)
                      : EdgeInsets.only(left: 5, right: 20),
                  decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width / 12,
                  height: MediaQuery.of(context).size.height / 200,
                ),
                Container(
                  margin: translator.currentLanguage == 'en'
                      ? EdgeInsets.only(right: 5)
                      : EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width / 6.5,
                  height: MediaQuery.of(context).size.height / 200,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
