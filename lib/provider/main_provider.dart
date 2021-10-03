import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/models/ads_model.dart';
import 'package:provider/provider.dart';

class MainProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  //----------------- Google ----------------------//
  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  // -------------- logout from Goodle ------------------------------//

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

//************************************************************************ */

  String _userName;
  String _userEmail;
  File _userPhoto;
  String _type;
  String _currentLanguage;

  String get userName {
    return _userName;
  }

  String get userEmail {
    return _userEmail;
  }

  File get userPhoto {
    return _userPhoto;
  }

  String get type {
    return _type;
  }

/************************************************************************* */
  String get currentLanguage {
    return _currentLanguage;
  }

  setCurrentLanguage(String currentLanguage) async {
    _currentLanguage = currentLanguage;
    notifyListeners();
  }

/******************************************************************************** */
  setUserName(String userName) async {
    _userName = userName;
    notifyListeners();
  }

  setUserEmail(String userEmail) async {
    _userEmail = userEmail;
    notifyListeners();
  }

  setUserPhoto(File userPhoto) async {
    _userPhoto = userPhoto;
    notifyListeners();
  }

  setType(String type) async {
    _type = type;
    notifyListeners();
  }

/**************************************************/

  Map<String, dynamic> _me;
  setMe(Map<String, dynamic> me) async {
    _me = me;
    notifyListeners();
  }

  Map<String, dynamic> get me => _me;
/****************************************************************** */

/**************************************************/

  List _categories = [];
  setCategories(List categories) async {
    _categories = categories;
    notifyListeners();
  }

  List get categories => _categories;
/****************************************************************** */

  List _topAucation = [];
  setTopAucation(List topAucation) async {
    _topAucation = topAucation;
    notifyListeners();
  }

  List get topAucation => _topAucation;

  /******************************************************/
  List _dailyAucation = [];
  setDailyAucation(List dailyAucation) async {
    _dailyAucation = dailyAucation;
    notifyListeners();
  }

  List get dailyAucation => _dailyAucation;
  /****************************************************************** */
  /******************************************************/
  List _allAucation = [];
  setAllAucation(List allAucation) async {
    _allAucation = allAucation;
    notifyListeners();
  }

  List get allAucation => _allAucation;
  /****************************************************************** */
  List _allAucationwithTopOpenPrice = [];
  setAllAucationwithTopOpenPrice(List allAucationwithTopOpenPrice) async {
    _allAucationwithTopOpenPrice = allAucationwithTopOpenPrice;
    notifyListeners();
  }

  List get allAucationwithTopOpenPrice => _allAucationwithTopOpenPrice;
  /****************************************************************** */

  /****************************************************************** */
  List _allAucationWithLowOpenPrice = [];
  setAllAucationWithLowOpenPrice(List allAucationWithLowOpenPrice) async {
    _allAucationWithLowOpenPrice = allAucationWithLowOpenPrice;
    notifyListeners();
  }

  List get allAucationWithLowOpenPrice => _allAucationWithLowOpenPrice;
  /****************************************************************** */
  /****************************************************************** */
  List _allAucationWithTopMarket = [];
  setAllAucationWithTopMarket(List allAucationWithTopMarket) async {
    _allAucationWithTopMarket = allAucationWithTopMarket;
    notifyListeners();
  }

  List get allAucationWithTopMarket => _allAucationWithTopMarket;
  /****************************************************************** */
  /****************************************************************** */
  List _allAucationWithLowMarket = [];
  setAllAucationWithLowMarket(List allAucationWithLowMarket) async {
    _allAucationWithLowMarket = allAucationWithLowMarket;
    notifyListeners();
  }

  List get allAucationWithLowMarket => _allAucationWithLowMarket;
  /****************************************************************** */
  List _allArchive = [];
  setAllArchive(List allArchive) async {
    _allArchive = allArchive;
    notifyListeners();
  }

  List get allArchive => _allArchive;
  /****************************************************************** */
  // List _specialAucationCat = [];
  // setSpecialAucationCat(List specialAucationCat) async {
  //   _specialAucationCat = specialAucationCat;
  //   notifyListeners();
  // }

  List get specialAucationCat => _topAucation;
  /****************************************************************** */
  List _schedules = [];
  setSchedules(List schedules) async {
    _schedules = schedules;
    notifyListeners();
  }

  List get schedules => _schedules;
}
