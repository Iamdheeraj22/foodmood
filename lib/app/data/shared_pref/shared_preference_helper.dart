import 'dart:async';

import 'package:foodmood/app/data/shared_pref/preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

//This class is used to handle sharedPreference
class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();
  // SharedPreferences instance
  static Future<SharedPreferences>? _sharedPreference;

  //This creates the single instance by calling
  // the `_internal` constructor specified below
  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  //This is what's used to retrieve the instance through the app
  static SharedPreferenceHelper getInstance() {
    _sharedPreference ??= SharedPreferences.getInstance();
    return _singleton;
  }

  // General Methods: ----------------------------------------------------------
  Future<String?> get firebaseNotificationToken async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.firebaseNotificationToken);
    });
  }

  Future<void> saveFirebaseNotificationToken(
      String firebaseNotificationToken) async {
    return _sharedPreference!.then((preference) {
      preference.setString(
          Preferences.firebaseNotificationToken, firebaseNotificationToken);
    });
  }

  Future<void> removeFirebaseNotificationToken() async {
    return _sharedPreference!.then((preference) {
      preference.remove(Preferences.firebaseNotificationToken);
    });
  }

  Future<String?> get apiToken async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.apiToken);
    });
  }

  Future<void> saveApiToken(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.apiToken, value);
    });
  }

  Future<String?> get deviceToken async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.deviceToken);
    });
  }

  Future<void> saveDeviceToken(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.deviceToken, value);
    });
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(Preferences.isLoggedIn) ?? false;
    });
  }

  Future<void> saveIsLoggedIn(bool value) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(Preferences.isLoggedIn, value);
    });
  }

  Future<bool> get isReadAnnouncements async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(Preferences.isReadAnnouncements) ?? false;
    });
  }

  Future<void> saveIsReadAnnouncements(bool value) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(Preferences.isReadAnnouncements, value);
    });
  }

  Future<String?> get userId async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userId);
    });
  }

  Future<void> saveUserId(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userId, value);
    });
  }

  Future<String?> get userEmail async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userEmail);
    });
  }

  Future<void> saveUserEmail(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userEmail, value);
    });
  }

  Future<String?> get userName async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userName);
    });
  }

  Future<void> saveUserName(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userName, value);
    });
  }

  Future<String?> get jobStatusTypes async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.jobStatusTypes);
    });
  }

  Future<void> saveJobStatusTyped(String value) {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.jobStatusTypes, value);
    });
  }

  Future<int?> get userRole async {
    return _sharedPreference!.then((preference) {
      return preference.getInt(Preferences.userBUSINESSTYPE);
    });
  }

  Future<void> saveUserRole(int value) async {
    return _sharedPreference!.then((preference) {
      preference.setInt(Preferences.userBUSINESSTYPE, value);
    });
  }

  Future<double?> get latitude async {
    return _sharedPreference!.then((preference) {
      return preference.getDouble(Preferences.userBUSINESSTYPE);
    });
  }

  Future<void> saveLatitude(double value) async {
    return _sharedPreference!.then((preference) {
      preference.setDouble(Preferences.userLatitude, value);
    });
  }

  Future<double?> get selectedAreaLat async {
    return _sharedPreference!.then((preference) {
      return preference.getDouble(Preferences.selectedAreaLat);
    });
  }

  Future<void> saveSelectedAreaLat(double value) async {
    return _sharedPreference!.then((preference) {
      preference.setDouble(Preferences.selectedAreaLat, value);
    });
  }

  Future<double?> get selectedAreaLong async {
    return _sharedPreference!.then((preference) {
      return preference.getDouble(Preferences.selectedAreaLong);
    });
  }

  Future<void> saveSelectedAreaLong(double value) async {
    return _sharedPreference!.then((preference) {
      preference.setDouble(Preferences.selectedAreaLong, value);
    });
  }

  Future<double?> get longitude async {
    return _sharedPreference!.then((preference) {
      return preference.getDouble(Preferences.userBUSINESSTYPE);
    });
  }

  Future<void> saveLongitude(double value) async {
    return _sharedPreference!.then((preference) {
      preference.setDouble(Preferences.userLongitude, value);
    });
  }

  Future<String?> get userInfo async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userInfo);
    });
  }

  Future<void> saveUserInfo(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userInfo, value);
    });
  }

  Future<String?> get selectedCity async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.selectedCity);
    });
  }

  Future<void> saveSelectedCity(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.selectedCity, value);
    });
  }

  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode {
    return _sharedPreference!.then((prefs) {
      return prefs.getBool(Preferences.isDarkMode) ?? false;
    });
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference!
        .then((prefs) => prefs.setBool(Preferences.isDarkMode, value));
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage {
    return _sharedPreference!.then((prefs) {
      return prefs.getString(Preferences.currentLanguage);
    });
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference!.then(
        (prefs) => prefs.setString(Preferences.currentLanguage, language));
  }

  //Clear preference:---------------------------------------------------
  Future<bool> clearPreference() async {
    await _sharedPreference!.then((prefs) {
      prefs.clear();
    });
    return true;
  }
}
