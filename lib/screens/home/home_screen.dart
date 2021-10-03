import 'dart:async';
import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/screens/mazad_detail.dart';
import 'package:matrix/screens/notification_screen.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/widgets/home_title.dart';
import 'package:matrix/widgets/king_card.dart';
import 'package:matrix/widgets/loading_indicator_widget.dart';
import 'package:matrix/widgets/mazad_bar.dart';
import 'package:matrix/widgets/single_mazad_widget.dart';
import 'package:matrix/widgets/title_line.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../all_auction.dart';
import '../all_kings_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<MainProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*-------------------------Header---------------------------- */
              Container(
                height: MediaQuery.of(context).size.height / 17,
                color: primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      future: Services.userData(context),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return LoadingIndicatorWidget();
                        }
                        dynamic me = snapshot.data;
                        print("me ${me.length}");
                        return me.length != 0
                            ? Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    child: CachedNetworkImage(
                                      imageUrl: me['img_path'],
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        "${me['name']}",
                                        maxFontSize: 13,
                                        minFontSize: 10,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: secondary,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "${me['units']} unit",
                                        style: TextStyle(
                                            color: secondary, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Container(
                                child: Text("can not find user data "),
                              );
                      },
                    ),
                    IconButton(
                        icon: Image.asset(
                          'assets/icons/notification.png',
                          color: Colors.white,
                        ),
                        iconSize: 28,
                        onPressed: () {
                          Navigator.push(
                              context,
                              TransitionPageRoute(
                                  widget: NotificationScreen()));
                        }),
                  ],
                ),
              ),
              Container(
                color: secondary,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 120,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 55),
              ),
              /* -----------------------First Ads ----------------------------*/
              FutureBuilder(
                future: Services.adsOneData(),
                builder: (context, AsyncSnapshot snapshot) {
                  return StatefulBuilder(builder: (context, setter) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return LoadingIndicatorWidget();
                    }
                    List<dynamic> adsOneData = snapshot.data;
                    return adsOneData.length != 0
                        ? Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: // double.infinity,
                                MediaQuery.of(context).size.width - 20,
                            child: Swiper(
                              autoplay: true,
                              itemCount: adsOneData.length,
                              onIndexChanged: (index) {
                                setter(() {
                                  _sliderIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 35),
                                  child: CachedNetworkImage(
                                    imageUrl: adsOneData[index].img_path,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(
                                      color: secondary,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      size: 35,
                                    ),
                                  ),
                                );
                              },
                              pagination: SwiperPagination(),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 4,
                            width: // double.infinity,
                                MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/notFount.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          );
                  });
                },
              ),
              //------------------------- title 1 -------------------//
              HomeTitle(
                  iconName: "brand-positioning.png",
                  title: "${translator.translate("home_title1")}"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              //------------------------ Top Aucation ---------------------//
              FutureBuilder(
                future: Services.getTopAucation(context),
                builder: (context, AsyncSnapshot snapshot) {
                  // List top = Provider.of<MainProvider>(context).topAucation;
                  if (snapshot.connectionState != ConnectionState.done) {
                    return LoadingIndicatorWidget();
                  }
                  List top = snapshot.data;

                  return top.length != 0
                      ? CarouselSlider(
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height / 5,
                              aspectRatio: 0.3,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 4),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.decelerate,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal),
                          items: List.generate(top.length, (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return MazaDetailScreen(
                                    id: top[index].id,
                                  );
                                }));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 1.3,
                                decoration: BoxDecoration(
                                    color: secondary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: AutoSizeText(
                                  translator.currentLanguage == 'ar'
                                      ? '${top[index].name_ar}'
                                      : '${top[index].name_en}',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            );
                          }))
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 3.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/notFount.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        );
                },
              ),
              /*-----------------------title line 1 ---------------------*/
              TitleLine(
                iconTitle: "calendar.png",
                buttunTitle: "${translator.translate("home_title3_sub")}",
                title: "${translator.translate("home_title2")}",
                secondPage: AllAuctionScreen(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              /*-------------------------Open Mazad ---------------------- */
              FutureBuilder(
                future: Services.getDailyAucation(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return LoadingIndicatorWidget();
                  }
                  List daily = snapshot.data;
                  return daily.length != 0
                      ? GridView.builder(
                          padding:
                              EdgeInsets.only(right: 10, left: 10, bottom: 10),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                          itemCount: daily.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return MazadWidget(
                                aucationId: daily[index].id,
                                imagePath: "${daily[index].img_path}",
                                mazadEndDate:
                                    DateTime.parse(daily[index].end_date),
                                mazadStartDate:
                                    DateTime.parse(daily[index].start_date),
                                title: translator.currentLanguage == 'ar'
                                    ? "${daily[index].name_ar}"
                                    : "${daily[index].name_en}",
                                price: "${daily[index].opening_price}");
                          })
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 3.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/notFount.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        );
                },
              ),
              /*-----------------------title line 2 ---------------------*/
              TitleLine(
                iconTitle: "brand-positioning.png",
                buttunTitle: "${translator.translate("home_title3_sub")}",
                title: "${translator.translate("home_title3")}",
                secondPage: AllAuctionScreen(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              /*--------------------Special Mazad-------------------- */
              Container(
                  height: MediaQuery.of(context).size.height / 1.9,
                  child: MazadBar()),
              //------------------------- title 2 -------------------//
              HomeTitle(
                  iconName: "calendar Bid.png",
                  title: "${translator.translate("home_title4")}"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              //------------------------ Mazad Schedual  ---------------------//
              FutureBuilder(
                future: Services().getSchedules(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return LoadingIndicatorWidget();
                  }
                  List schedules = Provider.of<MainProvider>(context).schedules;
                  if (schedules.length == 0) {
                    schedules = snapshot.data;
                  }
                  return schedules.length != 0
                      ? CarouselSlider(
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height / 8,
                              aspectRatio: 0.3,
                              viewportFraction: 0.4,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 600),
                              autoPlayCurve: Curves.easeInSine,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal),
                          items: List.generate(schedules.length, (index) {
                            return Container(
                                alignment: Alignment.center,
                                //   width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: secondary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: AutoSizeText(
                                  schedules[index],
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ));
                          }))
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/notFount.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        );
                },
              ),
              /*-----------------------Ads 2---------------------*/
              FutureBuilder(
                  future: Services.adsTwoData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return StatefulBuilder(builder: (context, setter) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return LoadingIndicatorWidget();
                      }
                      List<dynamic> adsData = snapshot.data;
                      return adsData.length != 0
                          ? Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: double.infinity,
                              //  MediaQuery.of(context).size.width - 20,
                              child: Swiper(
                                autoplay: false,
                                itemCount: adsData.length,
                                onIndexChanged: (index) {
                                  setter(() {
                                    _sliderIndex = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      String adsUrl = adsData[index].link;
                                      await canLaunch(adsUrl)
                                          ? launch(adsUrl)
                                          : print("can't open ad");
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: adsData[index].img_path,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        margin: EdgeInsets.only(
                                            bottom: 35, top: 35),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(
                                        color: secondary,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        size: 35,
                                      ),
                                    ),
                                  );
                                },
                                pagination: SwiperPagination(),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/error.png",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            );
                    });
                  }),
              /*------------------- title line 3------------------------ */

              TitleLine(
                iconTitle: "leadership.png",
                buttunTitle: "${translator.translate("home_title5_sub")}",
                title: "${translator.translate("home_title5")}",
                secondPage: AllKingsScreen(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              /*---------------------- All Kings ------------------------------- */
              KingCard(
                  name: "أندرو عياد",
                  auctionNumber: "300",
                  totalProfit: "5000",
                  profilePath: "assets/icons/user Profile.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              KingCard(
                  name: "احمد جمال",
                  auctionNumber: "300",
                  totalProfit: "5000",
                  profilePath: "assets/icons/user Profile.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              KingCard(
                  name: "محمد يسري",
                  auctionNumber: "300",
                  totalProfit: "5000",
                  profilePath: "assets/icons/user Profile.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              KingCard(
                  name: "علاء طارق",
                  auctionNumber: "300",
                  totalProfit: "5000",
                  profilePath: "assets/icons/user Profile.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              KingCard(
                  name: "بيتر الجاسر",
                  auctionNumber: "300",
                  totalProfit: "5000",
                  profilePath: "assets/icons/user Profile.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
