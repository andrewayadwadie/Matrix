import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';

class BuyUnitWidget extends StatefulWidget {
  final Function onPressedBuyUnitFun;
  final int buyUnitBalance;
  final int units;

  const BuyUnitWidget(
      {@required this.onPressedBuyUnitFun,
      @required this.buyUnitBalance,
      @required this.units});

  @override
  _BuyUnitWidgetState createState() => _BuyUnitWidgetState();
}

class _BuyUnitWidgetState extends State<BuyUnitWidget> {
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
                "assets/icons/coins.png",
                color: secondary,
                // width: MediaQuery.of(context).size.width / 30,
                // height: MediaQuery.of(context).size.height / 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            height: MediaQuery.of(context).size.height / 13,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                            "${widget.buyUnitBalance} ${translator.translate("price")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " ${translator.translate("balance")}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/coins.png",
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width / 13,
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                    ],
                  ),
                ),
                Container(
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
                        "${widget.units} ${translator.translate("unit")}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        "assets/icons/refund.png",
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width / 13,
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          InkWell(
              splashColor: Colors.yellowAccent,
              onTap: widget.onPressedBuyUnitFun,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "${translator.translate("buy_now")}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
