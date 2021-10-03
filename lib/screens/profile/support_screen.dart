import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("can't open Whatsapp");
  }

  int _radioValue = 1;
  final _formKey = GlobalKey<FormState>();
  String _name;
  var _phone;
  String _email;
  String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*------------------------------ header ----------------------- */
            Header(
                notification: false,
                back: true,
                icon: 'assets/icons/technical-support.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("contact_us")}",
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
//===========================================================================================================
            /* ------------------------------ radio Buttuns-------------------- */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                        fillColor: MaterialStateProperty.all(primary),
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (val) {
                          setState(() {
                            _radioValue = val;
                          });
                        }),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 40),
                  Text(
                    "${translator.translate("answer_call")}",
                    style: TextStyle(
                        color: secondary, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                        fillColor: MaterialStateProperty.all(primary),
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: (val) {
                          setState(() {
                            _radioValue = val;
                          });
                        }),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 40),
                  Text(
                    "${translator.translate("answer_email")}",
                    style: TextStyle(
                        color: secondary, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            /*---------------------------- form ---------------------- */
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    /* -------------------- Name ------------------- */
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 12,
                      ),
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        onSaved: (value) {
                          _name = value;
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            hintText:
                                '${translator.translate("register_username")}',
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),

                    //----------------- Phone--------------------------//
                    if (_radioValue == 1)
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12,
                        ),
                        height: MediaQuery.of(context).size.height / 10.5,
                        child: TextFormField(
                          onSaved: (value) {
                            _phone = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${translator.translate("register_validate_phone_empty")} ';
                            } else if (!value.startsWith('01')) {
                              return '${translator.translate("register_validate_not_phone")} ';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          cursorColor: primary,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              hintText:
                                  '${translator.translate("register_phone")}',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 4, color: primary),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 4, color: primary),
                                borderRadius: BorderRadius.circular(50),
                              )),
                          maxLength: 11,
                        ),
                      ),

                    //------------------ email -------------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 12,
                      ),
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        onSaved: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("register_validate_email_empty")}';
                          } else if (!value.contains("@")) {
                            return '${translator.translate("register_validate_not_email")}';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: primary,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            hintText:
                                '${translator.translate("register_email")}',
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

                    /*---------------------- Message -------------------------- */
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 12,
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                      child: TextFormField(
                        maxLines: 10,
                        onSaved: (value) {
                          _message = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("message_text_error")} ';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        cursorColor: primary,
                        decoration: InputDecoration(
                            errorMaxLines: 10,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            hintText: '${translator.translate("message_text")}',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 4, color: primary),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    /*----------------------------- Submit Button------------------------------------*/
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          print("name is : $_name");

                          print("phone is $_phone");

                          print("email is : $_email");
                          print("message is : $_message");
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
                          "${translator.translate("save")}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    )
                  ],
                )),
            /*---------------------------- Whatsapp ---------------------- */
            InkWell(
              onTap: () {
                launchWhatsapp(number: "+201281248732", message: "hi!");
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(7, 94, 84, 1),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/whatsapp.png",
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "${translator.translate("Whatsapp")}",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            )
          ],
        ),
      )),
    );
  }
}
