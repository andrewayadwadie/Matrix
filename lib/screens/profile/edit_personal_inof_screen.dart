import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  @override
  _EditPersonalInfoScreenState createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            /*------------------------------ header ----------------------- */
            Header(
                notification: false,
                back: true,
                icon: 'assets/icons/stamped.png',
                logo: true),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "${translator.translate("personal_info")}",
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

            /**------------------------ Form ------------------------------- */
            /*-----------------------------Name ------------------ */
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //----------------- user name --------------------------//
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
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: primary,
                            size: 30,
                          ),
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

                  //----------------- Phone--------------------------//
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),

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
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: primary,
                            size: 30,
                          ),
                          hintText: '${translator.translate("register_phone")}',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 4, color: primary),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 4, color: primary),
                            borderRadius: BorderRadius.circular(50),
                          )),
                      maxLength: 11,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),

                  /*----------------------------------- Submit Buttun --------------------------------------- */

                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        // send otp
                        print("name is : $_name");

                        print("phone is $_phone");
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
                    height: 50,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
