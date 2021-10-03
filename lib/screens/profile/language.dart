import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/widgets/header.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var isInt = true;
  @override
  Widget build(BuildContext context) {
    if (isInt) {
      Provider.of<MainProvider>(context, listen: false)
          .setCurrentLanguage(translator.currentLanguage);
      isInt = false;
    }

    //  print(" dddd ${Provider.of<MainProvider>(context).currentLanguage}");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                  notification: false,
                  back: true,
                  icon: 'assets/icons/language2.png',
                  logo: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Text(
                "${translator.translate("language")}",
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
                height: MediaQuery.of(context).size.height / 10,
              ),
/*-------------------------------  content ---------------------------------------- */

              InkWell(
                onTap: () {
                  translator.setNewLanguage(
                    context,
                    newLanguage: 'ar',
                    remember: true,
                    restart: true,
                  );
                },
                splashColor: primary,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: primary),
                        ),
                        child: Text(
                          "AR",
                          style: TextStyle(
                              color: secondary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Text(
                            "العربية ",
                            style: TextStyle(
                                color: secondary, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          if (Provider.of<MainProvider>(context)
                                  .currentLanguage ==
                              'ar')
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 2, color: primary),
                              ),
                              child: Icon(
                                Icons.check_sharp,
                                color: primary,
                                size: 12,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  translator.setNewLanguage(
                    context,
                    newLanguage: 'en',
                    remember: true,
                    restart: true,
                  );
                },
                splashColor: primary,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: primary),
                        ),
                        child: Text(
                          "EN",
                          style: TextStyle(
                              color: secondary, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: secondary, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          if (Provider.of<MainProvider>(context)
                                  .currentLanguage ==
                              'en')
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 2, color: primary),
                              ),
                              child: Icon(
                                Icons.check_sharp,
                                color: primary,
                                size: 12,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              )
              // ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(
              //     "حفظ",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
