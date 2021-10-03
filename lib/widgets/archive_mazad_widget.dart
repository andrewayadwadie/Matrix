import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/mazad_detail.dart';

import 'loading_indicator_widget.dart';

class ArchiveMazadWidget extends StatefulWidget {
  final String imagePath;
  final String profileImagePath;
  final String title;
  final String startPrice;
  final String endPrice;
  final String unit;
  final String endDate;
  final String name;
  final int rateItemCount;
  final double initialRating;

  ArchiveMazadWidget(
      {@required this.imagePath,
      @required this.title,
      @required this.startPrice,
      @required this.endPrice,
      @required this.unit,
      @required this.endDate,
      @required this.profileImagePath,
      @required this.name,
      @required this.rateItemCount,
      @required this.initialRating});
  @override
  _ArchiveMazadWidgetState createState() => _ArchiveMazadWidgetState();
}

class _ArchiveMazadWidgetState extends State<ArchiveMazadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.imagePath,
            imageBuilder: (context, imageProvider) => Container(
              // padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 2.1,
              height: MediaQuery.of(context).size.height / 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  )),
            ),
            placeholder: (context, url) => LoadingIndicatorWidget(),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              semanticLabel: url,
              size: 35,
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          size: 9,
                        ),
                        Text(
                          "${translator.translate("home_auction_price")}",
                          style: TextStyle(
                              color: secondary,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.startPrice} ${translator.translate("price")} ",
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          size: 9,
                        ),
                        Text(
                          "${translator.translate("home_auction_price_end")}",
                          style: TextStyle(
                              color: secondary,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.endPrice} ${translator.translate("price")} ",
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height / 500,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/stock-exchange-app.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          "${translator.translate("penefit")} : ${widget.unit} ${translator.translate("unit")}",
                          style: TextStyle(color: primary, fontSize: 9),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/calendar Bid.png",
                          width: MediaQuery.of(context).size.width / 28,
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 35,
                          color: secondary.withOpacity(0.09),
                          child: Text(widget.endDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height / 500,
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: primary,
                          backgroundImage: AssetImage(
                            widget.profileImagePath,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 8),
                            ),
                            RatingBar(
                              itemSize: 4,
                              initialRating: widget.initialRating,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: widget.rateItemCount,
                              ignoreGestures: true,
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 200,
                    ),
                    InkWell(
                      splashColor: secondary,
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(7)),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            ),
                            Text(
                              "${translator.translate("follow")}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
