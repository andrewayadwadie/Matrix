import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:async/src/delegate/stream.dart';
import 'package:matrix/models/ads_model.dart';
import 'package:matrix/models/all_archive_model.dart';
import 'package:matrix/models/all_aucations_model.dart';
import 'package:matrix/models/daily_location_model.dart';
import 'package:matrix/models/register_model.dart';
import 'package:matrix/models/single_aucation_model.dart';
import 'package:matrix/models/special_aucation_cat_model.dart';
import 'package:matrix/models/top_aucation_model.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:matrix/sharedPrefrences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../main.dart';

String baseUrl = "http://matrix.innovations-eg.com/api/";

//String token = LoginPref.getTokenValue() ?? '';

class Services {
  BuildContext context = navigatorKey.currentContext;
  final Uri regUrl = Uri.parse('${baseUrl}register');

  Future sendRegData(
      {@required name,
      @required emil,
      @required password,
      @required password_confirmation,
      @required phone,
      @required File img}) async {
    var stream = http.ByteStream(DelegatingStream.typed(img.openRead()));
    var length = await img.length();

    var request = new http.MultipartRequest("POST", regUrl);
    var multipartFile = new http.MultipartFile('img', stream, length,
        filename: basename(img.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    request.fields["name"] = name;
    request.fields["email"] = emil;
    request.fields["password"] = password;
    request.fields["password_confirmation"] = password_confirmation;
    request.fields["phone"] = phone;
    var response = await request.send();
    print("sdkdjjnkjdsa ${response.statusCode}");
    if (response.statusCode == 400) {
      return 0;
    }

    // try {
    //   var res = await http.post(
    //     regUrl,
    //     headers: <String, String>{"Content-type": "application/json"},
    //     body: jsonEncode({
    //       'name': name,
    //       'emil': emil,
    //       'password': password,
    //       'password_confirmation': password_confirmation,
    //       'phone': phone,
    //       'img': img,
    //     }),
    //   );
    //   if (res.statusCode == 200 || res.statusCode == 201) {
    //     if (jsonDecode(res.body) != false) {
    //       var userData = jsonDecode(res.body);
    //       return userData;
    //     }
    //     return null;
    //   }
    // } catch (e) {
    //   throw "exception is : $e";
    // }
  }

  //////////////////////////////// send verififcation code
  static Future sendVerificationCOde(String user_phone) async {
    print("user_phone ${user_phone}");
    var url = "https://smssmartegypt.com/sms/api/otp-send";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "username": "midoasp2",
        "password": "midoasp2",
        "sender": "Gomla ",
        "mobile": "2${user_phone}",
        "lang": "en/ar"
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return 1;
    } else {
      return 0;
    }
  }

  ////////////////////////////////////////// otp check
  static Future checkOtp(String otp, String user_phone) async {
    var url = "https://smssmartegypt.com/sms/api/otp-check";
    var response = await http.post(Uri.parse(url), body: {
      "username": "midoasp2",
      "password": "midoasp2",
      "sender": "Gomla",
      "mobile": "2${user_phone}",
      "otp": otp,
    });

    if (jsonDecode(response.body)["type"] == "error") {
      return false;
    } else {
      return true;
    }
  }

/*------------------------------------------------------------------------- */
/*------------------------------------------------------------------------- */

  static Future postLogin({
    @required String email,
    @required String password,
  }) async {
    var url = "${baseUrl}login";
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode({
          "email": email != null ? email : '',
          "password": password != null ? password : '',
        }),
      );
      if (res.statusCode == 401) {
        return 0;
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (jsonDecode(res.body) != false) {
          var loginDataJson = jsonDecode(res.body)['access_token'];

          return loginDataJson;
        }

        return null;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }

  /*==================================================== */
  static Future postLogout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('token');
    var url = "${baseUrl}logout";
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
          'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
        },
      );
      print("res is ${res.body} ");
      if (res.statusCode == 401) {
        return 0;
      }
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (jsonDecode(res.body) != false) {
          var logOutDataJson = jsonDecode(res.body)['message'];
          return logOutDataJson;
        }

        return null;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }

  static Future userData(BuildContext con) async {
    var url = "${baseUrl}me";
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          "Content-type": "application/json",
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
          'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
        },
      );

      if (res.statusCode == 401) {
        return 0;
      }
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (jsonDecode(res.body) != false) {
          var userDataJson = jsonDecode(res.body);

          Provider.of<MainProvider>(con, listen: false).setMe(userDataJson);
          Map<String, dynamic> userData =
              Provider.of<MainProvider>(con, listen: false).me;
          return userData;
        }

        return null;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }

  static Future adsTwoData() async {
    String url = "${baseUrl}adsTwo";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonAdsData = jsonDecode(res.body);
      var adsData = jsonAdsData.map((element) {
        return AdsTwoModel.fromJson(element);
      }).toList();
      return adsData;
    }
  }

  static Future adsOneData() async {
    String url = "${baseUrl}adsOne";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonAdsData = jsonDecode(res.body);
      var adsData = jsonAdsData.map((element) {
        return AdsOneModel.fromJson(element);
      }).toList();
      return adsData;
    }
  }

  static Future getCategories(BuildContext contextt) async {
    String url = "${baseUrl}categories";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> categoriesData = jsonData.map((element) {
        return Categories.fromJson(element);
      }).toList();
      Provider.of<MainProvider>(contextt, listen: false)
          .setCategories(categoriesData);
      List provCat =
          Provider.of<MainProvider>(contextt, listen: false).categories;

      return provCat;
    }
  }

/************************************************************************************************ */

  static Future getTopAucation(BuildContext con) async {
    String url = "${baseUrl}topAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> topData = jsonData.map((element) {
        return TopAucationModel.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false).setTopAucation(topData);
      List provTop = Provider.of<MainProvider>(con, listen: false).topAucation;
      print("token: ${LoginPref.getTokenValue()}");
      return provTop;
    }
  }
/**************************************************************/

  static Future getDailyAucation(BuildContext con) async {
    String url = "${baseUrl}dailyAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> dailyData = jsonData.map((element) {
        return DailyAucationModel.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false).setDailyAucation(dailyData);
      List provDaily =
          Provider.of<MainProvider>(con, listen: false).dailyAucation;
      return provDaily;
    }
  }

/**************************************************************/

  static Future getAllAucation(BuildContext con) async {
    String url = "${baseUrl}allAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allData = jsonData.map((element) {
        return AllAucationModel.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false).setAllAucation(allData);
      List provAll = Provider.of<MainProvider>(con, listen: false).allAucation;
      return provAll;
    }
  }
/**************************************************************/
/**************************************************************/

  static Future getAllAucationWithTopOpen(BuildContext con) async {
    String url = "${baseUrl}topOpeningPriceAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allData = jsonData.map((element) {
        return AllAucationWithTopOpen.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false)
          .setAllAucationwithTopOpenPrice(allData);
      List provAll = Provider.of<MainProvider>(con, listen: false)
          .allAucationwithTopOpenPrice;
      return provAll;
    }
  }
/**************************************************************/

/**************************************************************/

  static Future getAllAucationWithLowOpen(BuildContext con) async {
    String url = "${baseUrl}lowOpeningPriceAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allData = jsonData.map((element) {
        return AllAucationWithLowOpen.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false)
          .setAllAucationWithLowOpenPrice(allData);
      List provAll = Provider.of<MainProvider>(con, listen: false)
          .allAucationWithLowOpenPrice;
      return provAll;
    }
  }
/**************************************************************/
/**************************************************************/

  static Future getAllAucationWithTopMarket(BuildContext con) async {
    String url = "${baseUrl}topMarketPriceAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allData = jsonData.map((element) {
        return AllAucationWithTopMarket.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false)
          .setAllAucationWithTopMarket(allData);
      List provAll = Provider.of<MainProvider>(con, listen: false)
          .allAucationWithTopMarket;
      return provAll;
    }
  }
/**************************************************************/
/**************************************************************/

  static Future getAllAucationWithLowMarket(BuildContext con) async {
    String url = "${baseUrl}lowMarketPriceAuctions";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allData = jsonData.map((element) {
        return AllAucationWithLowMarket.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(con, listen: false)
          .setAllAucationWithLowMarket(allData);
      List provAll = Provider.of<MainProvider>(con, listen: false)
          .allAucationWithLowMarket;
      return provAll;
    }
  }
/**************************************************************/
/**************************************************************/

  Future getAllArchiveAucation() async {
    String url = "${baseUrl}AuctionArchive";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> allArchiveData = jsonData.map((element) {
        return AllArchiveModel.fromJson(element);
      }).toList();

      Provider.of<MainProvider>(context, listen: false)
          .setAllArchive(allArchiveData);
      List provAll =
          Provider.of<MainProvider>(context, listen: false).allArchive;
      return provAll;
    }
  }
/**************************************************************/

  static Future getSpecialCatAucation(int id) async {
    String url = "${baseUrl}specializedAuctions/$id";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> specialAucationData = jsonData.map((element) {
        return SpecialAucationCatModel.fromJson(element);
      }).toList();

      // Provider.of<MainProvider>(context, listen: false)
      //     .setSpecialAucationCat(specialAucationData);
      // List provSpecialAucation =
      //     Provider.of<MainProvider>(context, listen: false).specialAucationCat;
      return specialAucationData;
    }
  }
/* **************************************************************************** */

  Future getSchedules() async {
    String url = "${baseUrl}auctionSchedules";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<dynamic> schedules = jsonData.map((element) {
        return element;
      }).toList();

      Provider.of<MainProvider>(context, listen: false).setSchedules(schedules);

      return schedules;
    }
  }

  static Future getSingleAucationDetails(int id) async {
    String url = "${baseUrl}showAuction/$id";
    http.Response res =
        await http.get(Uri.parse(url), headers: <String, String>{
      "Content-type": "application/json",
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      'Authorization': 'Bearer ${LoginPref.getTokenValue()}',
    });
    if (res.statusCode == 200 || res.statusCode == 201) {
      var jsonData = jsonDecode(res.body);
      var jsonProductImage = jsonDecode(res.body)['product_images'];
      var jsonUser = jsonDecode(res.body)['user'];
      var jsonCategory = jsonDecode(res.body)['category'];

      dynamic aucationDetail = SingleAucationDetailModel.fromJson(jsonData);
      List<dynamic> auctionProductImage = jsonProductImage.map((e) {
        return SingleAucationImageListDetailModel.fromJson(e);
      }).toList();
      dynamic aucationUserDetails =
          SingleAucationUserDetailModel.fromJson(jsonUser);
      dynamic aucationCategoryDetails =
          SingleAucationCategoryDetailModel.fromJson(jsonCategory);
      return [
        aucationDetail,
        auctionProductImage,
        aucationUserDetails,
        aucationCategoryDetails
      ];
    }
  }

  static Future postJoinAucation({
    @required int auction_id,
    @required int price_auction,
    @required int gold_card,
    @required int silver_card,
  }) async {
    var url = "${baseUrl}auction";
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode({
          "auction_id": auction_id != null ? auction_id : '',
          "price_auction": price_auction != null ? price_auction : '',
          "gold_card": gold_card != null ? gold_card : '',
          "silver_card": silver_card != null ? silver_card : '',
        }),
      );
      switch (res.statusCode) {
        case 400:
          return 0;
        case 401:
          return 0;
        case 403:
          return 0;
        case 404:
          return 0;
        case 407:
          return 0;
        case 408:
          return 0;
        case 409:
          return 0;
        case 410:
          return 0;
        case 500:
          return 0;
        case 501:
          return 0;
        case 502:
          return 0;
        case 503:
          return 0;
        case 504:
          return 0;
      }

      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 202) {
        if (jsonDecode(res.body) != false) {
          var loginDataJson = jsonDecode(res.body);

          return loginDataJson;
        }

        return null;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }
}
