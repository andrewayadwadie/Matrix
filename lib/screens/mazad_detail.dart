import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/screens/realAucation/real_auction_screen.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/widgets/best_offer-widget.dart';
import 'package:matrix/widgets/loading_indicator_widget.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:matrix/constat.dart/colors.dart';

import '../navigation_bottom_bar.dart';
import 'charge_unit_screen.dart';

class MazaDetailScreen extends StatefulWidget {
  final int id;

  const MazaDetailScreen({@required this.id});

  @override
  _MazaDetailScreenState createState() => _MazaDetailScreenState();
}

class _MazaDetailScreenState extends State<MazaDetailScreen> {
  int _sliderIndex = 0;
  int _toggleIndex = 1;

  bool _aucationActive;
  bool _userHaveEnoughUnits;

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<MainProvider>(context, listen: false).me;

    if (userData['units'] < 4) {
      _userHaveEnoughUnits = false;
    } else {
      _userHaveEnoughUnits = true;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: Services.getSingleAucationDetails(widget.id),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width / 0.9,
                    child: LoadingIndicatorWidget());
              }
              var aucationDetail = snapshot.data[0];
              List auctionProductImage = snapshot.data[1];
              var aucationUserCreatorDetails = snapshot.data[2];
              var aucationCategoryDetails = snapshot.data[3];
              /********************************************************* */
              DateTime now = DateTime.now();
              DateTime startDate = DateTime.parse(aucationDetail.start_date);
              DateTime endtDate = DateTime.parse(aucationDetail.end_date);

              if (now.isBefore(startDate) && now.isAfter(endtDate)) {
                _aucationActive = false;
              } else if (now.isAfter(startDate) && now.isBefore(endtDate)) {
                _aucationActive = true;
              }
              return Column(
                children: [
                  /******************* Swiper and side bar ***************** */
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatefulBuilder(builder: (context, setter) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: // double.infinity,
                              MediaQuery.of(context).size.width / 1.2,
                          child: Swiper(
                            autoplay: false,
                            itemCount: auctionProductImage.length,
                            onIndexChanged: (index) {
                              setter(() {
                                _sliderIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        auctionProductImage[index].img_path,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: translator.currentLanguage ==
                                            'ar'
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(80))
                                        : BorderRadius.only(
                                            bottomRight: Radius.circular(80)),
                                  ),
                                  margin: EdgeInsets.only(bottom: 35),
                                ),
                              );
                            },
                            pagination: SwiperPagination(),
                          ),
                        );
                      }),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: translator.currentLanguage == 'ar'
                                  ? EdgeInsets.only(bottom: 13, right: 5)
                                  : EdgeInsets.only(bottom: 13, left: 5),
                              width: MediaQuery.of(context).size.width / 8,
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primary,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                margin: translator.currentLanguage == 'ar'
                                    ? EdgeInsets.only(bottom: 13, right: 5)
                                    : EdgeInsets.only(bottom: 13, left: 5),
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: primary,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/icons/notification.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                margin: translator.currentLanguage == 'ar'
                                    ? EdgeInsets.only(bottom: 13, right: 5)
                                    : EdgeInsets.only(bottom: 13, left: 5),
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: primary,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/icons/share.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Share.share(
                                      "share matrix application https://play.google.com/store/apps/details?id=com.innvotion.aboelazayem "),
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                margin: translator.currentLanguage == 'ar'
                                    ? EdgeInsets.only(bottom: 13, right: 5)
                                    : EdgeInsets.only(bottom: 13, left: 5),
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: primary,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/icons/favorite.png",
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  /******************* Product Name ***************** */
                  Container(
                    margin: translator.currentLanguage == 'ar'
                        ? EdgeInsets.only(right: 15)
                        : EdgeInsets.only(left: 15),
                    alignment: translator.currentLanguage == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      translator.currentLanguage == 'ar'
                          ? "إسم المنتج:   ${aucationDetail.name_ar}"
                          : "product name :   ${aucationDetail.name_en}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  /************************* time and price ************************* */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3.7,
                            height: MediaQuery.of(context).size.height / 30,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Text(
                              "${translator.translate("closing_time")}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width / 2.1,
                            height: MediaQuery.of(context).size.height / 16,
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primary),
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    "21",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    ":",
                                    style:
                                        TextStyle(color: primary, fontSize: 20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primary),
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    "59",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    ":",
                                    style:
                                        TextStyle(color: primary, fontSize: 20),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primary),
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    "00",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3.7,
                            height: MediaQuery.of(context).size.height / 30,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Text(
                              "${translator.translate("auction_price_now")}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width / 2.1,
                            height: MediaQuery.of(context).size.height / 16,
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: Text(
                                    "90 جنيه مصرياً ",
                                    style: TextStyle(
                                        color: primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  /***************** join to Acuation Section *********************** */
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      _userHaveEnoughUnits == true
                          ? InkWell(
                              onTap: () {
                                _aucationActive == true
                                    ? showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            title: Text(
                                              translator.currentLanguage == 'ar'
                                                  ? 'الانضمام الى المزاد '
                                                  : 'Join to Aucation ',
                                              style: TextStyle(
                                                  color: secondary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            content: Text(
                                              translator.currentLanguage == 'ar'
                                                  ? 'سيتم خصم 4 وحدات للإنضمام الى المزاد '
                                                  : '4 units will be deducted to join the auction',
                                              style: TextStyle(
                                                  color: primary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                            actions: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      TransitionPageRoute(
                                                          widget:
                                                              RealAucationScreen()));
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(10),
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: secondary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    translator.currentLanguage ==
                                                            'ar'
                                                        ? 'موافق'
                                                        : 'ok',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(10),
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.8),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    translator.currentLanguage ==
                                                            'ar'
                                                        ? 'إلغاء'
                                                        : 'cancel',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        })
                                    : showDialog(
                                        context: context,
                                        builder: (BuildContext ctx) {
                                          return Dialog(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      translator.currentLanguage ==
                                                              'ar'
                                                          ? 'الانضمام الى المزاد '
                                                          : 'Join to Aucation ',
                                                      style: TextStyle(
                                                          color: secondary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      translator.currentLanguage ==
                                                              'ar'
                                                          ? 'لا بمكن الانضمام الى هذا المزاد '
                                                          : 'can not join to this aucation ',
                                                      style: TextStyle(
                                                          color: primary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        decoration: BoxDecoration(
                                                            color: secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Text(
                                                          translator.currentLanguage ==
                                                                  'ar'
                                                              ? 'موافق'
                                                              : 'ok',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          );
                                        });
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: MediaQuery.of(context).size.width / 1.4,
                                height: MediaQuery.of(context).size.height / 12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _aucationActive == true
                                        ? secondary
                                        : Colors.grey),
                                child: Text(
                                  "${translator.translate("join")}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    TransitionPageRoute(
                                        widget: ChargeUnitScreen()));
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: MediaQuery.of(context).size.width / 1.4,
                                height: MediaQuery.of(context).size.height / 12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: secondary),
                                child: Text(
                                  "${translator.translate("charge_your_units")}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      Positioned(
                        bottom: 40,
                        right: 105,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 13,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(50),
                              color: primary),
                          child: IconButton(
                              icon: Image.asset(
                                "assets/icons/bid (1).png",
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  /***********************Aucation Creator ******************** */
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 5.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: primary,
                          backgroundImage: NetworkImage(
                            aucationUserCreatorDetails.img_path,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${aucationUserCreatorDetails.name}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            /*  RatingBar(
                              itemSize: 18,
                              initialRating: 3,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {},
                            ),*/
                            Text(
                              " 0 ${translator.translate("successful_auction")}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${translator.translate("total_profit")} : 0 ${translator.translate("price")}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        /*  InkWell(
                          splashColor: secondary,
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 17),
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
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  StatefulBuilder(builder: (context, setter) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setter(() {
                                      _toggleIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: BoxDecoration(
                                        color: _toggleIndex == 1
                                            ? primary
                                            : _toggleIndex == 2
                                                ? secondary
                                                : secondary,
                                        // border: Border(
                                        //   bottom: BorderSide(width: 3, color: secondary),
                                        // ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    child: Text(
                                      "${translator.translate("best_10_offers")}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: _toggleIndex == 1
                                      ? secondary
                                      : _toggleIndex == 2
                                          ? primary
                                          : primary,
                                  height:
                                      MediaQuery.of(context).size.height / 200,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setter(() {
                                      _toggleIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: BoxDecoration(
                                        color: _toggleIndex == 2
                                            ? primary
                                            : _toggleIndex == 1
                                                ? secondary
                                                : secondary,
                                        // border: Border(
                                        //   bottom: BorderSide(width: 3, color: secondary),
                                        // ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    child: Text(
                                      "${translator.translate("product_detail")}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: _toggleIndex == 2
                                      ? secondary
                                      : _toggleIndex == 1
                                          ? primary
                                          : primary,
                                  height:
                                      MediaQuery.of(context).size.height / 200,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),

                        /*---------------------------------- */
                        /*-----------------product details ----------------- */
                        if (_toggleIndex == 1)
                          ListView(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            children: [
                              /*********************** product name ****************** */
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3e3e3),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                    right: translator.currentLanguage == "ar"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                    left: translator.currentLanguage == "en"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.check_circle_outlined),
                                        Text(
                                          "${translator.translate("product_name")} : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: AutoSizeText(
                                            translator.currentLanguage == 'ar'
                                                ? aucationDetail.name_ar
                                                : aucationDetail.name_en,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              /*********************** descreption  ****************** */

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3e3e3),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                    right: translator.currentLanguage == "ar"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                    left: translator.currentLanguage == "en"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.check_circle_outlined),
                                        Text(
                                          "${translator.translate("product_decreption")} : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: AutoSizeText(
                                            translator.currentLanguage == 'ar'
                                                ? aucationDetail.desc_ar
                                                : aucationDetail.desc_en,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              /*********************** market price ****************** */

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3e3e3),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                    right: translator.currentLanguage == "ar"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                    left: translator.currentLanguage == "en"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.check_circle_outlined),
                                        Text(
                                          "${translator.translate("product_market_price")} : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: Text(
                                            "${aucationDetail.market_price} جنيه مصري ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              /*********************** open price  ****************** */

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3e3e3),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                    right: translator.currentLanguage == "ar"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                    left: translator.currentLanguage == "en"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.check_circle_outlined),
                                        Text(
                                          "${translator.translate("auction_open_price")} : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: Text(
                                            "${aucationDetail.opening_price}  جنيه مصري",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),

                              /*********************** max price for aucation   ****************** */
                              /*
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3e3e3),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                    right: translator.currentLanguage == "ar"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                    left: translator.currentLanguage == "en"
                                        ? BorderSide(width: 10, color: primary)
                                        : BorderSide(
                                            width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.check_circle_outlined),
                                        Text(
                                          "${translator.translate("auction_close_price")} : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: Text("200 جنيه",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)))
                                  ],
                                ),
                              ),
                            
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30)
                            */
                            ],
                          ),

                        /*----------------- Best 10 offers ----------------- */
                        if (_toggleIndex == 2)
                          ListView(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            children: [
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Andrew Ayad',
                                  price: '1000',
                                  isWinner: true),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Peter Nagy',
                                  price: '2000',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Ali Khalifa ',
                                  price: '500',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Alaa Tarek ',
                                  price: '2000',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Ahmed Gamal ',
                                  price: '2500',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'mohamed adel  ',
                                  price: '1000',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Mohamed Yousery ',
                                  price: '2300',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Morad hassan',
                                  price: '3200',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Eng/ Mahmoud ',
                                  price: '1200',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              BestOfferWidget(
                                  imgpath: 'assets/icons/user Profile.png',
                                  name: 'Eng/Mostafa ',
                                  price: '1500',
                                  isWinner: false),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                            ],
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                      ],
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
