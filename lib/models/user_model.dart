import 'package:flutter/cupertino.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String img_path;

  UserModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.phone,
      @required this.img_path});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        img_path: jsonData['img_path']);
  }
}
