
import 'package:e_books_website/modules/shared/constants.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';


class CashHelper {
  // Retrieve string data stored
  static Future<String> getSavedString(
      String value, String defaultValue) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? savedValue = _prefs.getString(value) ?? defaultValue;
    return savedValue;
  }

  static Future<int> getSavedInt(
      String value, int defaultValue) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int? savedValue = _prefs.getInt(value) ?? defaultValue;
    return savedValue;
  }
static Future<double> getSavedDouble(
      String value, double defaultValue) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    double? savedValue = _prefs.getDouble(value) ?? defaultValue;
    return savedValue;
  }

  static Future<bool> getSavedBoolean(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool? savedValue = _prefs.getBool(key) ?? true;
    return savedValue;
  }

// Store String data
  static Future<bool> setSavedString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool savedValue = await _prefs.setString(key, value);
    return savedValue;
  }

  static Future<bool> setSavedInt(String key, int value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool savedValue = await _prefs.setInt(key, value);
    return savedValue;
  }

  static Future<bool> setSavedDouble(String key, double value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool savedValue = await _prefs.setDouble(key, value);
    return savedValue;
  }

  static Future<bool> setSavedBoolean(String key, bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool savedValue = await _prefs.setBool(key, value);
    return savedValue;
  }

  static Future<bool> removeString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool savedValue = await _prefs.remove(key);
    return savedValue;
  }

  static logOut(context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    userId='';
    AppUtil.replacementNavigator(context, const MainApp());
  }
}
