import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/screens/chargeUnit/buy_unit_screen.dart';
import 'package:matrix/screens/chargeUnit/charge_unit_screen.dart';
import 'package:matrix/screens/chargeUnit/recharge_balance_onPhone_screen.dart';
import 'package:matrix/screens/chargeUnit/return_to_cash_screen.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/transition_page_route.dart';

class MyWalletScreen extends StatefulWidget {
  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
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
                icon: 'assets/icons/coins.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("unit_balance")}",
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
              height: MediaQuery.of(context).size.height / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 35),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 6,
                      color: primary,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${translator.translate("total_unit")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1000 ${translator.translate("unit")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      //  top: MediaQuery.of(context).size.height / 12,
                      right: 30,
                      bottom: MediaQuery.of(context).size.width / 3.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 9,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/icons/coins neww.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      //top: MediaQuery.of(context).size.height / 12,
                      right: MediaQuery.of(context).size.width / 50,
                      top: MediaQuery.of(context).size.height / 7.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              TransitionPageRoute(
                                  widget: RechargePhoneBalanceScreen()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: MediaQuery.of(context).size.height / 20,
                          // padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  "${translator.translate("charge_mobile_balance")}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8)),
                              Container(
                                // width: MediaQuery.of(context).size.width / 10,
                                // height: MediaQuery.of(context).size.height / 14,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: secondary,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Icon(Icons.arrow_forward_ios_outlined,
                                    size: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      width: MediaQuery.of(context).size.width / 2.4,
                      height: MediaQuery.of(context).size.height / 6,
                      color: primary,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${translator.translate("unit_per_pound")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1000 ${translator.translate("unit")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      //  top: MediaQuery.of(context).size.height / 12,
                      right: 30,
                      bottom: MediaQuery.of(context).size.width / 3.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 9,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/icons/money.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      //top: MediaQuery.of(context).size.height / 12,
                      right: MediaQuery.of(context).size.width / 200,
                      top: MediaQuery.of(context).size.height / 7,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  TransitionPageRoute(widget: ReturnToCash()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 25,
                              // padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: primary,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      "${translator.translate("recharge_cash")}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                  Container(
                                    // width: MediaQuery.of(context).size.width / 10,
                                    // height: MediaQuery.of(context).size.height / 14,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: secondary,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 10,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  TransitionPageRoute(widget: BuyUnitScreen()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 25,
                              // padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: primary,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${translator.translate("buy_unit")}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                  Container(
                                    // width: MediaQuery.of(context).size.width / 10,
                                    // height: MediaQuery.of(context).size.height / 14,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: secondary,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 10,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
