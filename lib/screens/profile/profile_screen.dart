import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/authentication/login.dart';
import 'package:matrix/screens/chargeUnit/charge_unit_screen.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/screens/profile/language.dart';
import 'package:matrix/screens/profile/settings_screen.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/sharedPrefrences/shared_preferences.dart';
import 'package:matrix/widgets/actions_dialogs.dart';
import 'package:matrix/widgets/loading_indicator_widget.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_account_screen.dart';
import 'support_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void launchYoutube() async {
    String url = "https://www.youtube.com/channel/UCiGm_E4ZwYSHV3bcW1pnSeQ";
    await canLaunch(url) ? launch(url) : print("can't open Whatsapp");
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<MainProvider>(context, listen: false).me;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
/*----------------------------------- Header ----------------------------------------------- */
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
                      SizedBox(width: MediaQuery.of(context).size.width / 7),
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
                      SizedBox(width: MediaQuery.of(context).size.width / 7),
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

/*------------------------------------------------------------------------ */

            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: MyAccount()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/user neww.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("my_account")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: LanguageScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/language.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("language")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: SettingScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/settings.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("settings")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {
                launchYoutube();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/youtube Setting.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("youtube")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/share.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("share_app")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, TransitionPageRoute(widget: SupportScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: secondary,
                      child: Image.asset(
                        "assets/icons/technical-support.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("support")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        content:
                            Text("${translator.translate('are_you_sure')}"),
                        actions: [
                          InkWell(
                            splashColor: secondary,
                            onTap: () async {
                              var res = await Services.postLogout();
                              print("log out $res");
                              if (res == null) {
                                SnackBar(
                                  content: Text("problem in session issues"),
                                  duration: Duration(seconds: 1),
                                );
                              } else {
                                Navigator.pop(ctx);
                                Navigator.push(context,
                                    TransitionPageRoute(widget: Login()));
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Text("${translator.translate('ok')}"),
                            ),
                          ),
                          // SizedBox(
                          //     width: MediaQuery.of(context).size.width / 3),
                          InkWell(
                            hoverColor: primary,
                            splashColor: secondary,
                            onTap: () {
                              Navigator.pop(ctx);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Text("${translator.translate('cancle')}"),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey),
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: translator.currentLanguage == "ar"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                    left: translator.currentLanguage == "en"
                        ? BorderSide(width: 10, color: primary)
                        : BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      color: Colors.redAccent,
                      child: Image.asset(
                        "assets/icons/logout.png",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${translator.translate("log_out")}",
                      style: TextStyle(
                          color: secondary, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
            ),
          ],
        ),
      )),
    );
  }
}
