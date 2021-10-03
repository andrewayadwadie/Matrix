import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';

import 'widgets/return_to_cash_widget.dart';

class ReturnToCash extends StatefulWidget {
  @override
  _ReturnToCashState createState() => _ReturnToCashState();
}

class _ReturnToCashState extends State<ReturnToCash> {
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
                icon: 'assets/icons/money-saving.png',
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
                  return ReturnToCashScreen(
                    units: 1000,
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
