import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/screens/home/home_screen.dart';
import 'package:matrix/services/service.dart';
import 'package:matrix/sharedPrefrences/shared_preferences.dart';
import 'package:matrix/widgets/transition_page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_nav_bar.dart';
import './register.dart';
import '../constat.dart/colors.dart';
import '../widgets/header.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  var _password;
  // String _token = LoginPref.getTokenValue();
  // String userToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Header(
                back: false,
                notification: false,
                icon: 'assets/icons/login.png',
                logo: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 18),
                child: Center(
                  child: Text(
                    "${translator.translate("login_login")} ",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 120,
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      margin: translator.currentLanguage == 'ar'
                          ? EdgeInsets.only(right: 9)
                          : EdgeInsets.only(left: 9),
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 120,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //----------------- user name --------------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 14,
                      ),
                      child: TextFormField(
                        onSaved: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("register_validate_name")} ';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        cursorColor: primary,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: primary,
                              size: 30,
                            ),
                            hintText: translator.currentLanguage == 'ar'
                                ? 'البريد الالكترونى '
                                : 'ُe-mail',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),

                    //----------------- Passwoord --------------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 14),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        cursorColor: primary,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("register_validate_password_empty")} ';
                          } else if (value.length < 8) {
                            return '${translator.translate("register_validate_not_password")}';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: primary,
                              size: 30,
                            ),
                            hintText:
                                '${translator.translate("login_password")}',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                    //----------------- Submit Button   --------------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    InkWell(
                      onTap: () async {
                        FirebaseMessaging.instance.getToken().then((value) {
                          //ذ print("firebase tiken ${value}");
                        });

                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var res = await Services.postLogin(
                              email: _email, password: _password);
                          if (res == 0) {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    content: Text("invalid login "),
                                    actions: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: Container(
                                          child: Text("Retry"),
                                        ),
                                      )
                                    ],
                                  );
                                });
                            print("erro login ");
                          } else {
                            // prefs.setString("token", res.toString());
                            LoginPref.setTokenValue(res.toString());
                            // print("prefs  ${LoginPref.getTokenValue()}");
                            // print("resssss issss : $res");

                            String token = LoginPref.getTokenValue();
                            // print("user token is : $token");
                            if (token != '' || token != null) {
                              Navigator.push(
                                  context,
                                  TransitionPageRoute(
                                      widget: ProvidedStylesExample()));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      content: Text("Error "),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: Container(
                                            child: Text("Retry"),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primary,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${translator.translate("login_login")}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //--------------- Or --------------------//
              // Container(
              //   alignment: Alignment.center,
              //   width: MediaQuery.of(context).size.width / 9,
              //   height: MediaQuery.of(context).size.height / 20,
              //   margin: EdgeInsets.symmetric(vertical: 15),
              //   decoration: BoxDecoration(
              //       color: secondary, borderRadius: BorderRadius.circular(50)),
              //   child: Text(
              //     '${translator.translate("or")}',
              //     style: TextStyle(
              //         color: primary,
              //         fontSize: 12,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              // //--------------- Social Media ---------------//
              // Container(
              //   margin: EdgeInsets.symmetric(
              //       horizontal: MediaQuery.of(context).size.width / 7),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       border: Border.all(width: 2, color: Colors.grey)),
              //   child: InkWell(
              //     onTap: () {
              //       final provider =
              //           Provider.of<MainProvider>(context, listen: false);
              //       provider.googleLogin();
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(17),
              //         color: Colors.white,
              //       ),
              //       padding: EdgeInsets.all(15),
              //       height: MediaQuery.of(context).size.height / 12,
              //       width: MediaQuery.of(context).size.width / 1.2,
              //       child: Image.asset('assets/icons/search.png'),
              //     ),
              //   ),
              // ),

              //--------------- Or --------------------//
              /* Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 9,
                height: MediaQuery.of(context).size.height / 20,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: secondary, borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'أو',
                  style: TextStyle(
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),*/
              //--------------- phone Register  ---------------//
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Register();
                  }));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10,
                      vertical: MediaQuery.of(context).size.height / 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primary,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${translator.translate("login_custom_register")}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
