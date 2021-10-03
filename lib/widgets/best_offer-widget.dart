import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';

class BestOfferWidget extends StatelessWidget {
  final String imgpath;
  final String name;
  final String price;
  final bool isWinner;

  const BestOfferWidget(
      {@required this.imgpath,
      @required this.name,
      @required this.price,
      @required this.isWinner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey),
          bottom: BorderSide(width: 1, color: Colors.grey),
          right: translator.currentLanguage == "ar"
              ? BorderSide(width: 10, color: primary)
              : BorderSide(width: 1, color: Colors.grey),
          left: translator.currentLanguage == "en"
              ? BorderSide(width: 10, color: primary)
              : BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: primary,
            backgroundImage: AssetImage(
              imgpath,
              // 'assets/icons/user Profile.png',
              //  "assets/icons/user Profile.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${translator.translate("offered_price")} : $price ${translator.translate("price")}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (isWinner == true)
            Image.asset(
              "assets/icons/trophy.png",
              color: primary,
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 10,
            ),
        ],
      ),
    );
  }
}
