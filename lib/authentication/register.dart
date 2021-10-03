import 'dart:io';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import './confirm_number.dart';
import '../constat.dart/colors.dart';
import '../provider/main_provider.dart';
import '../services/service.dart';
import '../widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File _image;
  Future _getImage() async {
    final PickedFile image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }
//----------------------------------------------------------------------//

  String name;
  String email;
  var phone;
  var password;
  var confirm;
  File imageFile;

//-----------------------------------------------------------------//

  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<MainProvider>(context, listen: false).setUserName(name);
  //   Provider.of<MainProvider>(context, listen: false).setUserEmail(email);
  //   Provider.of<MainProvider>(context, listen: false).setType(type);
  //   Provider.of<MainProvider>(context, listen: false).setUserPhoto(_image);
  //   super.initState();
  // }

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
                icon: 'assets/icons/stamped.png',
                logo: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: Center(
                  child: Text(
                    "${translator.translate("register_register")}",
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
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 12,
                      ),
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        onSaved: (value) {
                          name = value;
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
                    //------------------ email -------------------------//

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
                          email = value;
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
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: primary,
                              size: 30,
                            ),
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
                          phone = value;
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
                            hintText:
                                '${translator.translate("register_phone")}',
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
                            password = value;
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
                            hintText:
                                '${translator.translate("register_password")}',
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
                          confirm = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${translator.translate("register_validate_confirm_empty")}';
                          } else if (value != password) {
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
                              password == confirm
                                  ? Icons.lock_open
                                  : Icons.lock,
                              color: primary,
                              size: 30,
                            ),
                            hintText:
                                '${translator.translate("register_confirm")}',
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
                    //--------------------- img assets ---------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3,
                          vertical: 5),
                      child: Text(
                        "${translator.translate("register_image")}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    InkWell(
                        onTap: () => _getImage(),
                        child: _image != null
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width /
                                            3.5),
                                height: MediaQuery.of(context).size.height / 6,
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.add_photo_alternate,
                                size: 70,
                                color: secondary,
                              )),
                    //----------------- Submit Button   --------------------------//
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // send otp

                          // Services().sendRegData(
                          //     name: name,
                          //     emil: email,
                          //     password: password,
                          //     password_confirmation: confirm,
                          //     phone: phone,
                          //     img: _image);
                          // //     .then((value) {
                          // //   if (value.contain('error')) {
                          // //     print(
                          // //         "sdmfzmdgzmdfgkmsdfkgmassdfksdfnaskd whe tghsjfgjk sd");
                          // //   }
                          // // });

                          Services.sendVerificationCOde(phone).then((value) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ConfirmScreen(
                                name: name,
                                password: password,
                                phone_number: phone,
                                confirm: confirm,
                                email: email,
                                imageFile: _image,
                              ),
                            ));
                          });

                          /* */
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
                          "${translator.translate("register_register")}",
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
