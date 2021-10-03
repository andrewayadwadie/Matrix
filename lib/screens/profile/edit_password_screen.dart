import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/widgets/header.dart';

class EditPasswordScreen extends StatefulWidget {
  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  var _oldPassword;
  var _password;
  var _confirm;
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
              icon: 'assets/icons/lock.png',
              logo: true),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Text(
            "${translator.translate("edit_password")}",
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
                    color: secondary, borderRadius: BorderRadius.circular(100)),
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

          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //----------------- old Password --------------------------//
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  height: MediaQuery.of(context).size.height / 15,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _oldPassword = value;
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: primary,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primary,
                          size: 30,
                        ),
                        hintText: '${translator.translate("old_password")}',
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
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  height: MediaQuery.of(context).size.height / 15,
                  child: TextFormField(
                    // onSaved: (value) {
                    //   value = password;
                    // },
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: primary,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primary,
                          size: 30,
                        ),
                        hintText: '${translator.translate("new_password")}',
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

                //------------------ Confirm Password ------------//
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 12),
                  height: MediaQuery.of(context).size.height / 15,
                  child: TextFormField(
                    onSaved: (value) {
                      _confirm = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${translator.translate("register_validate_confirm_empty")}';
                      } else if (value != _password) {
                        return '${translator.translate("register_validate_not_confirm")}';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: primary,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primary,
                          size: 30,
                        ),
                        hintText:
                            '${translator.translate("new_password_confirm")}',
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

                /*----------------------------------- Submit Buttun --------------------------------------- */
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("old password is : $_oldPassword");
                      print("name is : $_password");

                      print("phone is $_confirm");
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
                  height: MediaQuery.of(context).size.height / 30,
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
