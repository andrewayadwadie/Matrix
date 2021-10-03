import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/widgets/all_aucation_widget.dart';
import 'package:matrix/widgets/all_aucation_widget.dart';
import 'package:matrix/widgets/archive_mazad_widget.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/loading_indicator_widget.dart';
import 'package:matrix/widgets/single_mazad_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'mazad_detail.dart';

class AllAuctionScreen extends StatefulWidget {
  @override
  _AllAuctionScreenState createState() => _AllAuctionScreenState();
}

class _AllAuctionScreenState extends State<AllAuctionScreen> {
  int _filterIndex = 2;
  int index = 0;
  int _orderBy;
  int _idOfArrange;

  @override
  void initState() {
    _orderBy = 5;

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List cat = Provider.of<MainProvider>(
      context,
    ).categories;
    print("all matrix categories is : ${Provider.of<MainProvider>(
      context,
    ).categories.length}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                  notification: true,
                  back: true,
                  icon: 'assets/icons/bid (1).png',
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
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
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
                                  /*/////////// /فرق السعر /////////////////////////// */
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _orderBy = 0;
                                      });
                                    },
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
                                          "${translator.translate("price_top_open")}",
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
                                  /****************************************************************** */
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _orderBy = 1;
                                      });
                                    },
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
                                          "${translator.translate("price_low_open")}",
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
                                  /********************************************************************** */
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _orderBy = 2;
                                      });
                                    },
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
                                          "${translator.translate("price_top_market")}",
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
                                  /********************************************************************* */
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _orderBy = 3;
                                      });
                                    },
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
                                          "${translator.translate("price_low_market")}",
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
                      // List category =
                      //     Provider.of<MainProvider>(context, listen: false)
                      //         .categories;
                      // print("category is : ${category.length}");
                      showCupertinoModalBottomSheet(
                        expand: false,
                        enableDrag: false,
                        isDismissible: false,
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (ctx) => Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*********** title ***********/
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
                                  /*********** Line ***********/
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
                                  /*********** LIst view of category ***********/
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        3.8,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: cat.length,
                                        itemBuilder: (ctxx, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    35,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _orderBy = 6;
                                                    _idOfArrange =
                                                        cat[index].id;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                          cat[index].img_path,
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(
                                                        color: secondary,
                                                        backgroundColor:
                                                            primary,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              10,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              30,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              60,
                                                    ),
                                                    Text(
                                                      translator.currentLanguage ==
                                                              'ar'
                                                          ? cat[index].name_ar
                                                          : cat[index].name_en,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    70,
                                              ),
                                              Divider(
                                                  thickness: 2,
                                                  color: Colors.grey),
                                            ],
                                          );
                                        }),
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
/******************************************************************************************* */
/******************************************************************************************* */
/******************************************************************************************* */
/******************************************************************************************* */
/******************************************************************************************* */

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: BoxDecoration(
                              color: index == 0 ? primary : secondary,
                              // border: Border(
                              //   bottom: BorderSide(width: 3, color: secondary),
                              // ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                          child: Text(
                            "${translator.translate("home_title3_sub")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: index == 0 ? secondary : primary,
                        height: MediaQuery.of(context).size.height / 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: BoxDecoration(
                              color: index == 2 ? primary : secondary,
                              // border: Border(
                              //   bottom: BorderSide(width: 3, color: secondary),
                              // ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                          child: Text(
                            "${translator.translate("auction_archive")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: index == 2 ? secondary : primary,
                        height: MediaQuery.of(context).size.height / 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              /*
             index = 0 ==> all aucation 
                _orderBy = 0  ==> all aucation with top open price
                _orderBy = 1  ==> all aucation with low open price
                _orderBy = 2  ==> all aucation with top market price
                _orderBy = 3  ==> all aucation with low market price
                _orderBy = 5  ==> all aucation 
                _orderBy = 6  ==> arange category
                _idOfArrange ==> id of each category of category list 
            index = 1 ==> Archive 
                all archive 
               */
              if (index == 0)
                _orderBy == 0
                    ? AllAucationWidget(
                        serviceFunction:
                            Services.getAllAucationWithTopOpen(context))
                    : _orderBy == 1
                        ? AllAucationWidget(
                            serviceFunction:
                                Services.getAllAucationWithLowOpen(context))
                        : _orderBy == 2
                            ? AllAucationWidget(
                                serviceFunction:
                                    Services.getAllAucationWithTopMarket(
                                        context))
                            : _orderBy == 3
                                ? AllAucationWidget(
                                    serviceFunction:
                                        Services.getAllAucationWithLowMarket(
                                            context))
                                : _orderBy == 5
                                    ? AllAucationWidget(
                                        serviceFunction:
                                            Services.getAllAucation(context))
                                    : AllAucationWidget(
                                        serviceFunction:
                                            Services.getSpecialCatAucation(
                                                _idOfArrange)),
              if (index == 2)
                FutureBuilder(
                  future: Services().getAllArchiveAucation(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return LoadingIndicatorWidget();
                    }

                    List allArchive = snapshot.data;

                    return allArchive.length != 0
                        ? GridView.builder(
                            padding: EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20),
                            itemCount: allArchive.length,
                            itemBuilder: (BuildContext ctx, index) {
                              formatAllDate(String a) => a.substring(0, 11);
                              return ArchiveMazadWidget(
                                imagePath: allArchive[index].img_path,
                                title: translator.currentLanguage == 'ar'
                                    ? allArchive[index].name_ar
                                    : allArchive[index].name_en,
                                startPrice:
                                    "${allArchive[index].opening_price}",
                                endPrice: '50',
                                unit: '5000',
                                endDate:
                                    "${formatAllDate(allArchive[index].end_date)}",
                                profileImagePath: 'assets/icons/user2.png',
                                name: 'Andrew Ayad',
                                rateItemCount: 5,
                                initialRating: 3,
                              );
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),

/******************************************************************************************* */
            ],
          ),
        ),
      ),
    );
  }
}
