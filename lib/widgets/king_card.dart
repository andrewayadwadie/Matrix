import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';

class KingCard extends StatelessWidget {
  final String name;
  final String auctionNumber;
  final String totalProfit;
  final String profilePath;

  const KingCard(
      {@required this.name,
      @required this.auctionNumber,
      @required this.totalProfit,
      @required this.profilePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 6,
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
              profilePath,
              //  "assets/icons/user Profile.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RatingBar(
                itemSize: 18,
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: false,
                ignoreGestures: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Image.asset(
                    'assets/icons/star.png',
                    color: primary,
                    fit: BoxFit.cover,
                  ),
                  half: Image.asset(
                    'assets/icons/star.png',
                  ),
                  empty: Image.asset(
                    'assets/icons/star.png',
                    color: Colors.grey,
                  ),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                " $auctionNumber ${translator.translate("successful_auction")}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${translator.translate("total_profit")} : $totalProfit ${translator.translate("price")}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          InkWell(
            splashColor: secondary,
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(7)),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "${translator.translate("follow")}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
