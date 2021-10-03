import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/archive_mazad_widget.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/single_mazad_widget.dart';

class MyAuctions extends StatefulWidget {
  @override
  _MyAuctionsState createState() => _MyAuctionsState();
}

class _MyAuctionsState extends State<MyAuctions> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Header(
                notification: true,
                back: false,
                icon: 'assets/icons/auction2.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
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
                        width: MediaQuery.of(context).size.width / 3.5,
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
                          "${translator.translate("favorite")}",
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
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                            color: index == 1 ? primary : secondary,
                            // border: Border(
                            //   bottom: BorderSide(width: 3, color: secondary),
                            // ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Text(
                          "${translator.translate("recent_auction")}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      color: index == 1 ? secondary : primary,
                      height: MediaQuery.of(context).size.height / 200,
                      width: MediaQuery.of(context).size.width / 3.5,
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
                        width: MediaQuery.of(context).size.width / 3.5,
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
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            if (index == 0)
              GridView.builder(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return MazadWidget(
                        aucationId: 1,
                        imagePath: "https://picsum.photos/id/237/200/300",
                        mazadEndDate: DateTime(2021),
                        mazadStartDate: DateTime(2022),
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
            if (index == 0)
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            if (index == 1)
              GridView.builder(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
                        aucationId: 1,
                        imagePath: "https://picsum.photos/id/237/200/300",
                        mazadEndDate: DateTime(2021),
                        mazadStartDate: DateTime(2022),
                        title: "كارت فودافون 100 جنيه",
                        price: "100");
                  }),
            if (index == 1)
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            if (index == 2)
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
                  itemCount: 2,
                  itemBuilder: (BuildContext ctx, index) {
                    return ArchiveMazadWidget(
                      imagePath: "https://picsum.photos/id/237/200/300",
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
              height: MediaQuery.of(context).size.height / 10,
            ),
          ],
        )),
      ),
    );
  }
}
