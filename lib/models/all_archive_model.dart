import 'package:flutter/material.dart';

class AllArchiveModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String desc_ar;
  final String desc_en;
  final int opening_price;
  final int market_price;
  final String start_date;
  final String end_date;
  final String img_path;

  AllArchiveModel(
      {@required this.name_ar,
      @required this.name_en,
      @required this.desc_ar,
      @required this.desc_en,
      @required this.opening_price,
      @required this.market_price,
      @required this.start_date,
      @required this.end_date,
      @required this.id,
      @required this.img_path});

  factory AllArchiveModel.fromJson(Map<String, dynamic> jsonData) {
    return AllArchiveModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'],
      name_en: jsonData['name_en'],
      desc_ar: jsonData['desc_ar'],
      desc_en: jsonData['desc_en'],
      opening_price: jsonData['opening_price'],
      market_price: jsonData['market_price'],
      start_date: jsonData['start_date'],
      end_date: jsonData['end_date'],
      img_path: jsonData['img_path'],
    );
  }
}
