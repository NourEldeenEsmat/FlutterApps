import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends ChangeNotifier {
  //using shared preferences to store data locally

  //keys for shared preferences
  static const String _authenticatedKey = 'authenticated';
  static const String _tokenKey = 'token';
  static const String _userId = 'userId';
  static const String _userName = 'userName';
  static const String _userRole = 'userRole';
  static const String _userEmail = 'userEmail';
  static const String _fullName = 'fullName';

  //getters
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? '';
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName) ?? '';
  }

  static Future<bool> getAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_authenticatedKey) ?? false;
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId) ?? '';
  }

  static Future<String> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRole) ?? '';
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmail) ?? '';
  }

  static Future<String> getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fullName) ?? '';
  }

  //setters
  static Future<void> setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, value);
  }

  static Future<void> setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, value);
  }

  static Future<void> setFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }


  static Future<void> setAuthenticated(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authenticatedKey, value);
  }

  static Future<void> setUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, value);
  }

  static Future<void> setUserRole(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userRole, value);
  }

  static Future<void> setUserEmail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmail, value);
  }
}
