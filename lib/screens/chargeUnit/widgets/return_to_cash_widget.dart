import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';

class ReturnToCashScreen extends StatefulWidget {
  final int units;

  const ReturnToCashScreen({@required this.units});

  @override
  _ReturnToCashScreenState createState() => _ReturnToCashScreenState();
}

class _ReturnToCashScreenState extends State<ReturnToCashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          DottedBorder(
            color: Colors.white,
            borderType: BorderType.Circle,
            strokeWidth: 5,
            strokeCap: StrokeCap.square,
            radius: Radius.circular(20),
            padding: EdgeInsets.all(6),
            dashPattern: [7, 10],
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 11.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 3, color: secondary, style: BorderStyle.none)),
              child: Image.asset(
                "assets/icons/money-saving.png",
                color: secondary,
                // width: MediaQuery.of(context).size.width / 30,
                // height: MediaQuery.of(context).size.height / 30,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 16),
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      " ${translator.translate("unit_balance")}  : ${widget.units} ${translator.translate("unit")}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8),
                    ),
                    Image.asset(
                      "assets/icons/refund.png",
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width / 12,
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primary,
                  ),
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${translator.translate("recharge_balance")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primary,
                  ),
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " ${translator.translate("recharge_cash")}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
