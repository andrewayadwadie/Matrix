import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/screens/chargeUnit/return_to_cash_screen.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';
import 'package:dotted_border/dotted_border.dart';

import 'buy_unit_screen.dart';
import 'recharge_balance_onPhone_screen.dart';

class ChargeUnitScreen extends StatefulWidget {
  @override
  _ChargeUnitScreenState createState() => _ChargeUnitScreenState();
}

class _ChargeUnitScreenState extends State<ChargeUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(
                notification: true,
                back: false,
                icon: 'assets/icons/wireless-charging.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("choose_unit")}",
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
            DottedBorder(
              color: secondary,
              borderType: BorderType.Circle,
              strokeWidth: 9,
              strokeCap: StrokeCap.square,
              radius: Radius.circular(20),
              padding: EdgeInsets.all(10),
              dashPattern: [5, 20],
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 3.1,
                height: MediaQuery.of(context).size.height / 7,
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 3, color: secondary, style: BorderStyle.none)),
                child: Image.asset(
                  "assets/icons/charges2.png",
                  color: Colors.white,
                  // width: MediaQuery.of(context).size.width / 30,
                  // height: MediaQuery.of(context).size.height / 30,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return RechargePhoneBalanceScreen();
                }));
              },
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: secondary),
                    ),
                    child: Text(
                      "${translator.translate("recharge_direct_balance_mobile")}",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Positioned(
                    left: translator.currentLanguage == 'en' ? 270 : null,
                    right: translator.currentLanguage == 'ar' ? 270 : null,
                    child: Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 9,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                            translator.currentLanguage == 'ar'
                                ? Icons.arrow_forward_ios_outlined
                                : Icons.arrow_forward_ios_outlined,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            DottedBorder(
              color: secondary,
              borderType: BorderType.Circle,
              strokeWidth: 9,
              strokeCap: StrokeCap.square,
              radius: Radius.circular(20),
              padding: EdgeInsets.all(10),
              dashPattern: [5, 20],
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 3.1,
                height: MediaQuery.of(context).size.height / 7,
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 3, color: secondary, style: BorderStyle.none)),
                child: Image.asset(
                  "assets/icons/coins.png",
                  color: Colors.white,
                  // width: MediaQuery.of(context).size.width / 30,
                  // height: MediaQuery.of(context).size.height / 30,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BuyUnitScreen();
                }));
              },
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: secondary),
                    ),
                    child: Text(
                      "${translator.translate("buy_unit")}",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Positioned(
                    left: translator.currentLanguage == 'en' ? 270 : null,
                    right: translator.currentLanguage == 'ar' ? 270 : null,
                    child: Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 9,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                            translator.currentLanguage == 'ar'
                                ? Icons.arrow_forward_ios_outlined
                                : Icons.arrow_forward_ios_outlined,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            DottedBorder(
              color: secondary,
              borderType: BorderType.Circle,
              strokeWidth: 9,
              strokeCap: StrokeCap.square,
              radius: Radius.circular(20),
              padding: EdgeInsets.all(10),
              dashPattern: [5, 20],
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 3.1,
                height: MediaQuery.of(context).size.height / 7,
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 3, color: secondary, style: BorderStyle.none)),
                child: Image.asset(
                  "assets/icons/money-saving.png",
                  color: Colors.white,
                  // width: MediaQuery.of(context).size.width / 30,
                  // height: MediaQuery.of(context).size.height / 30,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ReturnToCash();
                }));
              },
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 3, color: secondary),
                    ),
                    child: Text(
                      "${translator.translate("unit_to_cash")}",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Positioned(
                    left: translator.currentLanguage == 'en' ? 270 : null,
                    right: translator.currentLanguage == 'ar' ? 270 : null,
                    child: Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 9,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                            translator.currentLanguage == 'ar'
                                ? Icons.arrow_forward_ios_outlined
                                : Icons.arrow_forward_ios_outlined,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            )
          ],
        ),
      )),
    );
  }
}
