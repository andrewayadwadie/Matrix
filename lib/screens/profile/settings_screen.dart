import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/sharedPrefrences/shared_preferences.dart';
import 'package:matrix/widgets/header.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchValue = true;
  bool _switchEtsalatValue = true;
  bool _switchVodafoneValue = true;
  bool _switchOrangeValue = true;
  bool _switchGeneralValue = true;

  @override
  void initState() {
    super.initState();

    _switchValue = NotificationSwitcher.getSwitchValue() ?? true;
    _switchEtsalatValue = NotificationSwitcher.getEtsalatSwitch() ?? true;
    _switchVodafoneValue = NotificationSwitcher.getVodafoneSwitch() ?? true;
    _switchOrangeValue = NotificationSwitcher.getOrangeSwitch() ?? true;
    _switchGeneralValue = NotificationSwitcher.getGeneralSwitch() ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                  notification: false,
                  back: true,
                  icon: 'assets/icons/settings.png',
                  logo: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Text(
                "${translator.translate("settings")}",
                style: TextStyle(
                    color: secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
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
                        color: primary,
                        borderRadius: BorderRadius.circular(100)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),

/*-------------------------------  content ---------------------------------------- */
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${translator.translate("recieve_notification")}",
                      style: TextStyle(
                        color: secondary,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    buildSwitch(),
                  ],
                ),
              ),
              if (_switchValue == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
/*---------------------------- title 1 ----------------------- */
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        "${translator.translate("setting_auction_categories")}",
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: translator.currentLanguage == 'ar'
                                ? EdgeInsets.only(left: 8)
                                : EdgeInsets.only(right: 8),
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
                                color: primary,
                                borderRadius: BorderRadius.circular(100)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),

/* ------------------------Choices 1---------------------------------*/
                      /*Etsalat */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check_circle_outline_sharp,
                            size: 18,
                          ),
                          Text(
                            "${translator.translate("setting_etsalat_card")}",
                            style: TextStyle(color: secondary, fontSize: 15),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          buildEtsalatSwitch(),
                        ],
                      ),
                      /* vodafone */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check_circle_outline_sharp,
                            size: 18,
                          ),
                          Text(
                            "${translator.translate("setting_vodafone_card")}",
                            style: TextStyle(color: secondary, fontSize: 15),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          buildVodafoneSwitch(),
                        ],
                      ),
                      /*Orange */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check_circle_outline_sharp,
                            size: 18,
                          ),
                          Text(
                            "${translator.translate("setting_orange_card")}",
                            style: TextStyle(color: secondary, fontSize: 15),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          buildOrangeSwitch(),
                        ],
                      ),

                      /*---------------------------- title 2 ----------------------- */
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        "${translator.translate("setting_general_notification")}",
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: translator.currentLanguage == 'ar'
                                ? EdgeInsets.only(left: 8)
                                : EdgeInsets.only(right: 8),
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
                                color: primary,
                                borderRadius: BorderRadius.circular(100)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),

                      /* ------------------------Choices 1---------------------------------*/
                      /*------------------ General Notification---------------- */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check_circle_outline_sharp,
                            size: 18,
                          ),
                          Text(
                            "${translator.translate("setting_general_categories")}",
                            style: TextStyle(color: secondary, fontSize: 13),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          buildGeneralSwitch(),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 1.8,
        child: Switch.adaptive(
            activeColor: secondary,
            activeTrackColor: primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black87,
            value: _switchValue,
            onChanged: (val) async {
              setState(() {
                _switchValue = val;
              });
              await NotificationSwitcher.setSwitchValue(val);
            }),
      );
  Widget buildEtsalatSwitch() => Transform.scale(
        scale: 1.2,
        child: Switch.adaptive(
            activeColor: secondary,
            activeTrackColor: primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black87,
            value: _switchEtsalatValue,
            onChanged: (val) async {
              setState(() {
                _switchEtsalatValue = val;
              });
              await NotificationSwitcher.setEtsalatSwitch(val);
            }),
      );
  Widget buildVodafoneSwitch() => Transform.scale(
        scale: 1.2,
        child: Switch.adaptive(
            activeColor: secondary,
            activeTrackColor: primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black87,
            value: _switchVodafoneValue,
            onChanged: (val) async {
              setState(() {
                _switchVodafoneValue = val;
              });
              await NotificationSwitcher.setVodafoneSwitch(val);
            }),
      );
  Widget buildOrangeSwitch() => Transform.scale(
        scale: 1.2,
        child: Switch.adaptive(
            activeColor: secondary,
            activeTrackColor: primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black87,
            value: _switchOrangeValue,
            onChanged: (val) async {
              setState(() {
                _switchOrangeValue = val;
              });
              await NotificationSwitcher.setOrangeSwitch(val);
            }),
      );
  Widget buildGeneralSwitch() => Transform.scale(
        scale: 1.2,
        child: Switch.adaptive(
            activeColor: secondary,
            activeTrackColor: primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black87,
            value: _switchGeneralValue,
            onChanged: (val) async {
              setState(() {
                _switchGeneralValue = val;
              });
              await NotificationSwitcher.setGeneralSwitch(val);
            }),
      );
}
