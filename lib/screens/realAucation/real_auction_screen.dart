import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/screens/chargeUnit/charge_unit_screen.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/screens/notification_screen.dart';
import 'package:matrix/widgets/archive_mazad_widget.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/single_mazad_widget.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:provider/provider.dart';

class RealAucationScreen extends StatefulWidget {
  @override
  _RealAucationScreenState createState() => _RealAucationScreenState();
}

class _RealAucationScreenState extends State<RealAucationScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<MainProvider>(context, listen: false).me;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
/***************************** Header  *************************** */
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  color: primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          userData['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            translator.currentLanguage == 'ar'
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 2,
                    top: MediaQuery.of(context).size.height / 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${userData['units']}",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  TransitionPageRoute(
                                      widget: ChargeUnitScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 15,
                              height: MediaQuery.of(context).size.height / 33,
                              decoration: BoxDecoration(
                                  color: secondary,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    left: MediaQuery.of(context).size.width / 2.5,
                    top: MediaQuery.of(context).size.height / 17,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2, color: Colors.white),
                        image: DecorationImage(
                            image: NetworkImage(userData['img_path']),
                            fit: BoxFit.cover,
                            onError: (index, stacktrace) {
                              return Text("error!");
                            }),
                      ),
                    )),
              ],
            ),

/***************************** Timer ********************************/
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                        translator.currentLanguage == 'ar'
                            ? "مزاد رقم  : 20"
                            : "Aucation No : 20",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 8,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: primary),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            "21",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            ":",
                            style: TextStyle(
                                color: primary,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: primary),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            "59",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            ":",
                            style: TextStyle(
                                color: primary,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: primary),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Text(
                            "00",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
/*********************************************************************/
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
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
                          translator.currentLanguage == 'ar'
                              ? "تفاصيل المنتج "
                              : "product details ",
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
                          translator.currentLanguage == 'ar'
                              ? "نشاط المزاد "
                              : "aucation active ",
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
                          translator.currentLanguage == 'ar'
                              ? " أعلى عروض "
                              : " best offers ",
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
        ),
      ),
    ));
  }
}
