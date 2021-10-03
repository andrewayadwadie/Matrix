import 'package:shared_preferences/shared_preferences.dart';

class NotificationSwitcher {
  static SharedPreferences _preferences;
  static const _switchValue = 'switchValue';
  static const _switchEtsalatValue = 'switchEtsalatValue';
  static const _switchVodafoneValue = 'switchVodafoneValue';
  static const _switchOrangeValue = 'switchOrangeValue';
  static const _switchGeneralValue = 'switchGeneralValue';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

/*-------------------------------Main Switch---------------------------- */
  static Future setSwitchValue(bool value) async {
    await _preferences.setBool(_switchValue, value);
  }

  static bool getSwitchValue() {
    return _preferences.getBool(_switchValue);
  }
/*---------------------------------------------------------------------- */

/*-------------------------------Etsalat Switch---------------------------- */
  static Future setEtsalatSwitch(bool value) async {
    await _preferences.setBool(_switchEtsalatValue, value);
  }

  static bool getEtsalatSwitch() {
    return _preferences.getBool(_switchEtsalatValue);
  }
/*---------------------------------------------------------------------- */

/*-------------------------------Vodafone Switch---------------------------- */
  static Future setVodafoneSwitch(bool value) async {
    await _preferences.setBool(_switchVodafoneValue, value);
  }

  static bool getVodafoneSwitch() {
    return _preferences.getBool(_switchVodafoneValue);
  }
/*---------------------------------------------------------------------- */

/*-------------------------------Orange Switch---------------------------- */
  static Future setOrangeSwitch(bool value) async {
    await _preferences.setBool(_switchOrangeValue, value);
  }

  static bool getOrangeSwitch() {
    return _preferences.getBool(_switchOrangeValue);
  }
/*---------------------------------------------------------------------- */

/*-------------------------------General Switch---------------------------- */
  static Future setGeneralSwitch(bool value) async {
    await _preferences.setBool(_switchGeneralValue, value);
  }

  static bool getGeneralSwitch() {
    return _preferences.getBool(_switchGeneralValue);
  }

/*---------------------------------------------------------------------- */

}

class LoginPref {
  static SharedPreferences _loginPreferences;
  static const _token = 'token';

  static Future init() async {
    _loginPreferences = await SharedPreferences.getInstance();
  }

/*------------------------------- Token---------------------------- */
  static Future setTokenValue(String value) async {
    await _loginPreferences.setString(_token, value);
  }

  static String getTokenValue() {
    return _loginPreferences.getString(_token);
  }

  static Future clearToken() async {
    await _loginPreferences.clear();
  }

/*---------------------------------------------------------------------- */
}
