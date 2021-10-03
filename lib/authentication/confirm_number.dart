import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/authentication/login.dart';
import 'package:matrix/widgets/transition_page_route.dart';

import '../services/service.dart';

import '../constat.dart/colors.dart';
import '../widgets/header.dart';
import 'package:pinput/pin_put/pin_put.dart';
// import 'package:pinput/pin_put/pin_put_state.dart';

class ConfirmScreen extends StatefulWidget {
  final String phone_number;
  final String name;
  final String email;
  final String password;
  final String confirm;
  final File imageFile;
  ConfirmScreen(
      {@required this.phone_number,
      @required this.name,
      @required this.email,
      @required this.password,
      @required this.imageFile,
      @required this.confirm});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final formKey = GlobalKey<FormState>();

  String code;

  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  pinPutDecoration(Color color, double round) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(round),
    );
  }

  final errorSnackBar = SnackBar(
    content: Text(
      "someThing wrong please check that your phone or email dosn't exist before",
      style: TextStyle(color: secondary, fontWeight: FontWeight.bold),
    ),
    backgroundColor: primary,
    duration: Duration(seconds: 3),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Header(
                back: true,
                notification: false,
                icon: 'assets/icons/login verification.png',
                logo: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    "تأكيد رقم الموبايل ",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: translator.currentLanguage == 'ar'
                    ? const EdgeInsets.only(top: 20, right: 120)
                    : const EdgeInsets.only(top: 20, left: 120),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration(primary, 3),
                  selectedFieldDecoration: pinPutDecoration(primary, 5),
                  followingFieldDecoration:
                      pinPutDecoration(Colors.grey[200], 5),
                  pinAnimationType: PinAnimationType.scale,
                  onSubmit: (pin) async {
                    try {
                      setState(() {
                        code = pin;
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text('أدخل الرقم الصحيح الذي تم أرساله'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                ),
              ),

              //----------------- Submit Button   --------------------------//
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              InkWell(
                onTap: () async {
                  bool value =
                      await Services.checkOtp(code, widget.phone_number);
                  if (value) {
                    await Services()
                        .sendRegData(
                      emil: widget.email,
                      name: widget.name,
                      password: widget.password,
                      password_confirmation: widget.confirm,
                      phone: widget.phone_number,
                      img: widget.imageFile,
                    )
                        .then((value) {
                      if (value == 0) {
                        return showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.yellow[600],
                                title: Text(
                                  '${translator.translate('register_error_title')}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: Text(
                                  "${translator.translate('register_error')}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: secondary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: Text(
                                        "${translator.translate("ok")}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      } else {
                        Navigator.push(
                            context, TransitionPageRoute(widget: Login()));
                      }
                      print("resresres $value");
                    });
                  }

                  /// check otp funtction
                  // bool value =await Services().checkOtp(code, widget.phone_number);
                  // if (value) {
                  //   print(widget.imageFile.toString());
                  //   int res = await Services().sendRegData(
                  //     emil: widget.email,
                  //     name: widget.name,
                  //     password: widget.password,
                  //     password_confirmation: widget.confirm,
                  //     phone: widget.phone_number,
                  //     img: widget.imageFile,
                  //   );
                  //   print("res $res");
                  /*Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Login();
                    }));*/
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text('أدخل الرقم الصحيح الذي تم أرساله'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: secondary,
                    ));
                  }
                  print("code is $code");
                  print("number is : ${widget.phone_number}");

                  /// if success  onConfirm func
                  /// navgat to home screen
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
                    "تأكيد ",
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
