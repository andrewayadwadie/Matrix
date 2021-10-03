import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  String copounNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(
                notification: true,
                back: true,
                icon: 'assets/icons/debit-card.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("payment_method")}",
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
            Container(
              width: MediaQuery.of(context).size.width / 1.17,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey[350])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DottedBorder(
                    color: primary,
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
                          color: primary,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 3,
                              color: secondary,
                              style: BorderStyle.none)),
                      child: Image.asset(
                        "assets/icons/money.png",
                        color: Colors.white,
                        // width: MediaQuery.of(context).size.width / 30,
                        // height: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                color: secondary,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${translator.translate("package_name")} : ",
                                style: TextStyle(color: secondary),
                              )
                            ],
                          ),
                          Text(
                            "باقة ال 400 جنيه ",
                            style: TextStyle(color: primary),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                color: secondary,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${translator.translate("unit_no")} : ",
                                style: TextStyle(color: secondary),
                              )
                            ],
                          ),
                          Text(
                            "25 ${translator.translate("unit")}",
                            style: TextStyle(color: primary),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                color: secondary,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${translator.translate("amount_of_cash")} : ",
                                style: TextStyle(color: secondary),
                              )
                            ],
                          ),
                          Text(
                            "100 ${translator.translate("price")}",
                            style: TextStyle(color: primary),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Align(
              alignment: translator.currentLanguage == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${translator.translate("choose")} ${translator.translate("payment_method")}",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Row(
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
/*-------------------------------------------------------------------------------- */
            Container(
              width: MediaQuery.of(context).size.width / 1.17,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey[350])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(width: 3, color: primary),
                            borderRadius: BorderRadius.circular(50)),
                        child: StatefulBuilder(
                          builder: (context, setter) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 22,
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${translator.translate("fawry")}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/8.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "${translator.translate("tech_support")}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.17,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey[350])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(width: 3, color: primary),
                            borderRadius: BorderRadius.circular(50)),
                        child: StatefulBuilder(
                          builder: (context, setter) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 22,
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${translator.translate("vodafone_cash")}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/vodafone.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    "${translator.translate("tech_support")}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.17,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey[350])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(width: 3, color: primary),
                            borderRadius: BorderRadius.circular(50)),
                        child: StatefulBuilder(
                          builder: (context, setter) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 22,
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${translator.translate("orange_cash")}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/orange.png"),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    "${translator.translate("tech_support")}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.17,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey[350])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(width: 3, color: primary),
                            borderRadius: BorderRadius.circular(50)),
                        child: StatefulBuilder(
                          builder: (context, setter) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 22,
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${translator.translate("etsalat_cash")}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/itsalat.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    "${translator.translate("tech_support")}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
/*-------------------------------------------------------------------------------- */
            Form(
              key: _formKey,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12,
                    ),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '${translator.translate("copoun_validate")} ';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        copounNo = value;
                      },
                      keyboardType: TextInputType.phone,
                      cursorColor: primary,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10),
                          hintText: '${translator.translate("copoun_code")}',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: primary),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 19,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "${translator.translate("aplly_copoun")}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 18,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    "${translator.translate("buying_done")}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                    right: translator.currentLanguage == 'ar'
                        ? MediaQuery.of(context).size.width / 1.7
                        : null,
                    left: translator.currentLanguage == 'en'
                        ? MediaQuery.of(context).size.width / 1.7
                        : null,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.width / 7.7,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Image.asset(
                        "assets/icons/checkmark.png",
                        color: Colors.white,
                        fit: BoxFit.fill,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
          ],
        ),
      )),
    );
  }
}
