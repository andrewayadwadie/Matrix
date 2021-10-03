import 'package:flutter/material.dart';

class AdsTwoModel {
  final int id;
  final String link;
  final String img_path;

  AdsTwoModel(
      {@required this.id, @required this.link, @required this.img_path});

  factory AdsTwoModel.fromJson(Map<String, dynamic> jsonData) {
    return AdsTwoModel(
        id: jsonData['id'],
        link: jsonData['link'],
        img_path: jsonData['img_path']);
  }
}

class AdsOneModel {
  final int id;
  // ignore: non_constant_identifier_names
  final String img_path;

  AdsOneModel({@required this.id, @required this.img_path});

  factory AdsOneModel.fromJson(Map<String, dynamic> jsonData) {
    return AdsOneModel(id: jsonData['id'], img_path: jsonData['img_path']);
  }
}

class Categories {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;

  Categories(
      {@required this.id,
      @required this.img_path,
      @required this.name_ar,
      @required this.name_en});

  factory Categories.fromJson(Map<String, dynamic> jsonData) {
    return Categories(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en'],
        img_path: jsonData['img_path']);
  }
}
