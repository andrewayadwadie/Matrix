import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/archive_mazad_widget.dart';

import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/transition_page_route.dart';

import 'payment_method_screen.dart';
import 'widgets/charge_package_widget.dart';

class RechargePhoneBalanceScreen extends StatefulWidget {
  @override
  _RechargePhoneBalanceScreenState createState() =>
      _RechargePhoneBalanceScreenState();
}

class _RechargePhoneBalanceScreenState
    extends State<RechargePhoneBalanceScreen> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber;
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
                icon: 'assets/icons/charges2.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("charge_mobile_balance")}",
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
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 12,
                      ),
                      height: MediaQuery.of(context).size.height / 12,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("register_validate_phone_empty")} ';
                          } else if (!value.startsWith('01')) {
                            return '${translator.translate("register_validate_not_phone")} ';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          phoneNumber = value;
                        },
                        keyboardType: TextInputType.phone,
                        cursorColor: primary,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10),
                            hintText:
                                '${translator.translate("register_phone")}',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: primary),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: primary),
                              borderRadius: BorderRadius.circular(8),
                            )),
                        maxLength: 11,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    GridView.builder(
                        padding:
                            EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
                          return ChargePackageWidget(
                            onPressedFun: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.push(
                                    context,
                                    TransitionPageRoute(
                                        widget: PaymentMethodScreen()));
                              }
                            },
                            //PaymentMethodScreen()
                            balance: 100,
                            unit: 25,
                          );
                        }),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
          ],
        ),
      )),
    );
  }
}
