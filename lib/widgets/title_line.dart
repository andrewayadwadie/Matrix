import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/all_auction.dart';
import 'package:matrix/widgets/transition_page_route.dart';

class TitleLine extends StatelessWidget {
  final String iconTitle;
  final String title;
  final String buttunTitle;
  final Widget secondPage;

  const TitleLine(
      {@required this.iconTitle,
      @required this.title,
      @required this.buttunTitle,
      @required this.secondPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 13),
          color: secondary,
          height: MediaQuery.of(context).size.height / 14,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/$iconTitle",
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 30,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 3.2,
                margin: translator.currentLanguage == 'en'
                    ? EdgeInsets.only(right: 10)
                    : EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(10)),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        TransitionPageRoute(widget: secondPage));
                  },
                  label: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                  icon: Text(
                    buttunTitle,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 200,
        )
      ],
    );
  }
}
