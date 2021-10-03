import 'dart:io';

import 'package:flutter/foundation.dart';

class RegisterModel {
  final String name;
  final String emil;
  final String password;
  final String password_confirmation;
  final String phone;
  final File img;

  RegisterModel(
      {@required this.name,
      @required this.emil,
      @required this.password,
      @required this.password_confirmation,
      @required this.phone,
      @required this.img});
  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
        name: jsonData['name'],
        emil: jsonData['email'],
        password: jsonData['password'],
        password_confirmation: jsonData['password_confirmation'],
        phone: jsonData['phone'],
        img: jsonData['img']);
  }
}

class LoginModel {
  final String emil;
  final String password;

  LoginModel({
    @required this.emil,
    @required this.password,
  });
  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      emil: jsonData['email'],
      password: jsonData['password'],
    );
  }
}
