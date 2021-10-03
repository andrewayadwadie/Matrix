import 'package:flutter/material.dart';
import 'package:matrix/screens/mazad_detail.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/widgets/archive_mazad_widget.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/king_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:matrix/constat.dart/colors.dart';

class AllKingsScreen extends StatefulWidget {
  @override
  _AllKingsScreenState createState() => _AllKingsScreenState();
}

class _AllKingsScreenState extends State<AllKingsScreen> {
  int _filterIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                  notification: true,
                  back: true,
                  icon: 'assets/icons/trophy22.png',
                  logo: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              /*------------------------------- filter buttons ------------------------------ */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _filterIndex = 0;
                      });
                      showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.white,
                        enableDrag: false,
                        isDismissible: false,
                        builder: (ctx) => Stack(
                          children: [
                            // Positioned(
                            //   bottom: 240,
                            //   right:
                            //       translator.currentLanguage == 'en' ? 10 : 0,
                            //   left: translator.currentLanguage == 'ar' ? 10 : 0,
                            //   child: InkWell(
                            //     onTap: () {
                            //       Navigator.pop(ctx);
                            //     },
                            //   ),
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            translator.currentLanguage == 'en'
                                                ? EdgeInsets.only(
                                                    left: 10,
                                                    top: 20,
                                                    bottom: 8)
                                                : EdgeInsets.only(
                                                    right: 10,
                                                    top: 20,
                                                    bottom: 8),
                                        child: Text(
                                          "${translator.translate("ordered_by_filter")}",
                                          style: TextStyle(
                                              color: secondary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: primary,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "x",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                        decoration: BoxDecoration(
                                            color: secondary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                        decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 35,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/label.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Text(
                                          "${translator.translate("price_difference")}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  Divider(thickness: 2, color: Colors.grey),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/clock-circular-outline.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Text(
                                          "${translator.translate("from_newest_to_oldest")}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 5,
                              color: _filterIndex == 0
                                  ? primary
                                  : _filterIndex == 1
                                      ? secondary
                                      : secondary),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "${translator.translate("ordered_by_filter")}",
                        style: TextStyle(
                            color: secondary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _filterIndex = 1;
                      });
                      showCupertinoModalBottomSheet(
                        expand: false,
                        enableDrag: false,
                        isDismissible: false,
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (ctx) => Stack(
                          children: [
                            // Positioned(
                            //   bottom: 240,
                            //   right: 10,
                            //   // left: translator.currentLanguage == 'ar'
                            //   //     ? 10
                            //   //     : null,

                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            translator.currentLanguage == 'en'
                                                ? EdgeInsets.only(
                                                    left: 10,
                                                    top: 20,
                                                    bottom: 8)
                                                : EdgeInsets.only(
                                                    right: 10,
                                                    top: 20,
                                                    bottom: 8),
                                        child: Text(
                                          "${translator.translate("categories_filter")}",
                                          style: TextStyle(
                                              color: secondary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: primary,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "x",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                        decoration: BoxDecoration(
                                            color: secondary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                        decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 35,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/sim.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Text(
                                          "${translator.translate("vodafone")}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  Divider(thickness: 2, color: Colors.grey),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/sim.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Text(
                                          "${translator.translate("orange")}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  Divider(thickness: 2, color: Colors.grey),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/sim.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Text(
                                          "${translator.translate("etsalat")}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 5,
                              color: _filterIndex == 1
                                  ? primary
                                  : _filterIndex == 0
                                      ? secondary
                                      : secondary),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "${translator.translate("categories_filter")}",
                        style: TextStyle(
                            color: secondary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
/*------------------------------------ All Aucation ---------------------------------------- */
              GridView.builder(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
                    return KingWidget(
                      imagePath: "assets/images/6.jpg",
                      title: "كارت فودافون 100 جنيه",
                      startPrice: "100",
                      endPrice: '200',
                      unit: '5000',
                      endDate: "12-07-2021",
                      profileImagePath: 'assets/icons/user2.png',
                      name: 'Andrew Ayad',
                      rateItemCount: 5,
                      initialRating: 3,
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
