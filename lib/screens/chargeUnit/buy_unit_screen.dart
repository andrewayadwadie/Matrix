import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/screens/chargeUnit/widgets/buy_unit_widget.dart';
import 'package:matrix/constat.dart/colors.dart';

import 'package:matrix/widgets/header.dart';

class BuyUnitScreen extends StatefulWidget {
  @override
  _BuyUnitScreenState createState() => _BuyUnitScreenState();
}

class _BuyUnitScreenState extends State<BuyUnitScreen> {
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
                icon: 'assets/icons/coins.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("buy_unit")}",
              style: TextStyle(
                  color: secondary, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 200,
                  decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(100)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 200,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(100)),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
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
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  return BuyUnitWidget(
                    onPressedBuyUnitFun: () {},
                    buyUnitBalance: 100,
                    units: 25,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
          ],
        ),
      )),
    );
  }
}
