import 'package:flutter/material.dart';

class SingleAucationDetailModel {
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

  SingleAucationDetailModel(
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

  factory SingleAucationDetailModel.fromJson(Map<String, dynamic> jsonData) {
    return SingleAucationDetailModel(
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

class SingleAucationImageListDetailModel {
  final int id;
  final String img_path;

  SingleAucationImageListDetailModel(
      {@required this.id, @required this.img_path});

  factory SingleAucationImageListDetailModel.fromJson(
      Map<String, dynamic> jsonData) {
    return SingleAucationImageListDetailModel(
      id: jsonData['id'],
      img_path: jsonData['img_path'],
    );
  }
}

class SingleAucationUserDetailModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String units;
  final String win_units;
  final String gold_cards;
  final String silver_cards;
  final String img_path;

  SingleAucationUserDetailModel(
      {@required this.email,
      @required this.phone,
      @required this.units,
      @required this.win_units,
      @required this.gold_cards,
      @required this.silver_cards,
      @required this.name,
      @required this.id,
      @required this.img_path});

  factory SingleAucationUserDetailModel.fromJson(
      Map<String, dynamic> jsonData) {
    return SingleAucationUserDetailModel(
        email: jsonData['email'] != null ? jsonData['email'] : ' ',
        phone: jsonData['phone'] != null ? jsonData['phone'] : ' ',
        units: jsonData['units'] != null ? jsonData['units'] : ' ',
        win_units: jsonData['win_units'] != null ? jsonData['win_units'] : ' ',
        gold_cards:
            jsonData['gold_cards'] != null ? jsonData['gold_cards'] : ' ',
        silver_cards:
            jsonData['silver_cards'] != null ? jsonData['silver_cards'] : ' ',
        name: jsonData['name'] != null ? jsonData['name'] : ' ',
        id: jsonData['id'] != null ? jsonData['id'] : ' ',
        img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ');
  }
}

class SingleAucationCategoryDetailModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;

  SingleAucationCategoryDetailModel(
      {@required this.name_en,
      @required this.name_ar,
      @required this.id,
      @required this.img_path});

  factory SingleAucationCategoryDetailModel.fromJson(
      Map<String, dynamic> jsonData) {
    return SingleAucationCategoryDetailModel(
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        id: jsonData['id'] != null ? jsonData['id'] : ' ',
        img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ');
  }
}
