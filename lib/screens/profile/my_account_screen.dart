import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/authentication/register.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';
import 'package:matrix/widgets/transition_page_route.dart';

import 'bills.dart';
import 'edit_password_screen.dart';
import 'edit_personal_inof_screen.dart';
import 'my_auction_wining_screen.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            /*------------------------------ header ----------------------- */
            Header(
                notification: false,
                back: true,
                icon: 'assets/icons/round-account-button-with-user-inside.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("my_account")}",
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
              height: MediaQuery.of(context).size.height / 25,
            ),

/*------------------------------- content ------------------------ */
//===================================================================
            InkWell(
              onTap: () {
                Navigator.push(context,
                    TransitionPageRoute(widget: EditPersonalInfoScreen()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/round-account-button-with-user-inside.png",
                      width: MediaQuery.of(context).size.width / 18,
                      height: MediaQuery.of(context).size.height / 35,
                      color: secondary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        "${translator.translate("account_edit")}",
                        style: TextStyle(
                            fontSize: 13,
                            color: secondary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: secondary,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
/*------------------------------------------------------------------------ */
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: EditPasswordScreen()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/lock.png",
                      width: MediaQuery.of(context).size.width / 18,
                      height: MediaQuery.of(context).size.height / 35,
                      color: secondary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        "${translator.translate("password_edit")}",
                        style: TextStyle(
                            color: secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: secondary,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
/*------------------------------------------------------------------------ */
            InkWell(
              onTap: () {
                Navigator.push(context, TransitionPageRoute(widget: Bills()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/checklist.png",
                      width: MediaQuery.of(context).size.width / 18,
                      height: MediaQuery.of(context).size.height / 35,
                      color: secondary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        "${translator.translate("bills")}",
                        style: TextStyle(
                            color: secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: secondary,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
/*------------------------------------------------------------------------ */
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: MyWiningAucations()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/trophy22.png",
                      width: MediaQuery.of(context).size.width / 18,
                      height: MediaQuery.of(context).size.height / 35,
                      color: secondary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        "${translator.translate("my_wining_aucation")}",
                        style: TextStyle(
                            color: secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: secondary,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
/*------------------------------------------------------------------------ */
          ],
        ),
      )),
    );
  }
}
