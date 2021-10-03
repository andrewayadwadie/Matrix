import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/models/ads_model.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/screens/all_auction.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/widgets/header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'loading_indicator_widget.dart';
import 'single_mazad_widget.dart';

int _toggleIndex = 1;
int catId = 1;

class MazadBar extends StatefulWidget {
  @override
  _MazadBarState createState() => _MazadBarState();
}

class _MazadBarState extends State<MazadBar> {
  @override
  Widget build(BuildContext context) {
    //  List cat = Provider.of<MainProvider>(context).categories;
    //  List special = Provider.of<MainProvider>(context).specialAucationCat;
    return FutureBuilder(
      future: Services.getCategories(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LoadingIndicatorWidget();
        }
        List cat = snapshot.data;

        return Column(
          children: [
            CatsBar(setState, cat),
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              child: FutureBuilder(
                future: Services.getSpecialCatAucation(catId),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return LoadingIndicatorWidget();
                  }

                  List special = snapshot.data;

                  return special.length != 0
                      ? GridView.builder(
                          padding: EdgeInsets.only(
                              right: 10, left: 10, bottom: 10, top: 10),
                          shrinkWrap: true,
                          //   physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                          itemCount: special.length,
                          itemBuilder: (BuildContext ctx, index) {
                            // formatH(Duration h) => h
                            //     .toString()
                            //     .substring(0, 3)
                            //     .replaceAll(new RegExp(r'[^\w\s]+'), '');
                            // formatM(Duration m) => m
                            //     .toString()
                            //     .substring(2, 4)
                            //     .replaceAll(new RegExp(r'[^\w\s]+'), '');
                            // formatS(Duration s) => s
                            //     .toString()
                            //     .substring(4, 6)
                            //     .replaceAll(new RegExp(r'[^\w\s]+'), '');

                            return MazadWidget(
                                aucationId: special[index].id,
                                imagePath: "${special[index].img_path}",
                                mazadEndDate:
                                    DateTime.parse(special[index].end_date),
                                mazadStartDate:
                                    DateTime.parse(special[index].start_date),
                                title: translator.currentLanguage == 'ar'
                                    ? "${special[index].name_ar}"
                                    : "${special[index].name_en}",
                                price: "${special[index].opening_price}");
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
            ),
          ],
        );
      },
    );
  }
}

/*
DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
              unselectedLabelColor: primary,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)), // Creates border
                  color: secondary), //Change background color from here
              tabs: [
                AutoSizeText(
                  "${translator.translate("orange")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "${translator.translate("vodafone")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "${translator.translate("etsalat")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "${translator.translate("we")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "${translator.translate("we")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "${translator.translate("we")}",
                  maxLines: 2,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 2,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 1,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 2,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
              GridView.builder(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 1,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        imagePath: "assets/images/4.jpg",
                        second: "21",
                        minute: "05",
                        hour: "00",
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
            ],
          ),
        ))
 */
class CatsBar extends StatelessWidget {
  final Function onTap;
  List cat;
  CatsBar(this.onTap, this.cat);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /* **************** Tabs ***************** */
        Column(
          children: [
            InkWell(
              onTap: () {
                _toggleIndex = 1;
                onTap(() {
                  catId = cat[0].id;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: _toggleIndex == 1
                        ? primary
                        : _toggleIndex == 2
                            ? secondary
                            : _toggleIndex == 3
                                ? secondary
                                : _toggleIndex == 4
                                    ? secondary
                                    : _toggleIndex == 5
                                        ? secondary
                                        : secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AutoSizeText(
                  translator.currentLanguage == 'ar'
                      ? "${cat[0].name_ar}"
                      : "${cat[0].name_en}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: _toggleIndex == 1
                  ? secondary
                  : _toggleIndex == 2
                      ? primary
                      : _toggleIndex == 3
                          ? primary
                          : _toggleIndex == 4
                              ? primary
                              : _toggleIndex == 5
                                  ? primary
                                  : primary,
              height: MediaQuery.of(context).size.height / 200,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                _toggleIndex = 2;
                onTap(() {
                  catId = cat[1].id;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: _toggleIndex == 2
                        ? primary
                        : _toggleIndex == 1
                            ? secondary
                            : _toggleIndex == 3
                                ? secondary
                                : _toggleIndex == 4
                                    ? secondary
                                    : _toggleIndex == 5
                                        ? secondary
                                        : secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AutoSizeText(
                  translator.currentLanguage == 'ar'
                      ? "${cat[1].name_ar}"
                      : "${cat[1].name_en}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: _toggleIndex == 2
                  ? secondary
                  : _toggleIndex == 1
                      ? primary
                      : _toggleIndex == 3
                          ? primary
                          : _toggleIndex == 4
                              ? primary
                              : _toggleIndex == 5
                                  ? primary
                                  : primary,
              height: MediaQuery.of(context).size.height / 200,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                _toggleIndex = 3;
                onTap(() {
                  catId = cat[2].id;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: _toggleIndex == 3
                        ? primary
                        : _toggleIndex == 1
                            ? secondary
                            : _toggleIndex == 2
                                ? secondary
                                : _toggleIndex == 4
                                    ? secondary
                                    : _toggleIndex == 5
                                        ? secondary
                                        : secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AutoSizeText(
                  translator.currentLanguage == 'ar'
                      ? "${cat[2].name_ar}"
                      : "${cat[2].name_en}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: _toggleIndex == 3
                  ? secondary
                  : _toggleIndex == 1
                      ? primary
                      : _toggleIndex == 2
                          ? primary
                          : _toggleIndex == 4
                              ? primary
                              : _toggleIndex == 5
                                  ? primary
                                  : primary,
              height: MediaQuery.of(context).size.height / 200,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                _toggleIndex = 4;
                onTap(() {
                  catId = cat[3].id;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: _toggleIndex == 4
                        ? primary
                        : _toggleIndex == 1
                            ? secondary
                            : _toggleIndex == 2
                                ? secondary
                                : _toggleIndex == 3
                                    ? secondary
                                    : _toggleIndex == 5
                                        ? secondary
                                        : secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AutoSizeText(
                  translator.currentLanguage == 'ar'
                      ? "${cat[3].name_ar}"
                      : "${cat[3].name_en}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: _toggleIndex == 4
                  ? secondary
                  : _toggleIndex == 1
                      ? primary
                      : _toggleIndex == 2
                          ? primary
                          : _toggleIndex == 3
                              ? primary
                              : _toggleIndex == 5
                                  ? primary
                                  : primary,
              height: MediaQuery.of(context).size.height / 200,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                _toggleIndex = 5;

                Navigator.push(
                    context, TransitionPageRoute(widget: AllAuctionScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: _toggleIndex == 5
                        ? primary
                        : _toggleIndex == 1
                            ? secondary
                            : _toggleIndex == 2
                                ? secondary
                                : _toggleIndex == 3
                                    ? secondary
                                    : _toggleIndex == 4
                                        ? secondary
                                        : secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: AutoSizeText(
                  "${translator.translate("other")}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: _toggleIndex == 5
                  ? secondary
                  : _toggleIndex == 1
                      ? primary
                      : _toggleIndex == 2
                          ? primary
                          : _toggleIndex == 3
                              ? primary
                              : _toggleIndex == 4
                                  ? primary
                                  : primary,
              height: MediaQuery.of(context).size.height / 200,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ],
        ),
      ],
    );
  }
}
