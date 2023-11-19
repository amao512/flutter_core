import 'dart:ui';

import 'package:flutter_core/core/data/constants/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureDataSource {
  SecureDataSource(this._prefs);

  final SharedPreferences? _prefs;

  saveAccessToken(String token) {
    _prefs?.setString(CorePrefConstants.prefToken, token);
  }

  String? getAccessToken() {
    return _prefs?.getString(CorePrefConstants.prefToken);
  }

  bool isAuthorized() {
    return _prefs?.getString(CorePrefConstants.prefToken)?.isNotEmpty == true;
  }

  clearAccessToken() {
    _prefs?.remove(CorePrefConstants.prefToken);
  }

  saveRefreshToken(String token) {
    _prefs?.setString(CorePrefConstants.prefRefreshToken, token);
  }

  clearRefreshToken() {
    _prefs?.remove(CorePrefConstants.prefRefreshToken);
  }

  String? getRefreshToken() {
    return _prefs?.getString(CorePrefConstants.prefRefreshToken);
  }

  savePhoneNumber(String phoneNumber) {
    _prefs?.setString(CorePrefConstants.prefPhoneNumber, phoneNumber);
  }

  String? getPhoneNumber() {
    return _prefs?.getString(CorePrefConstants.prefPhoneNumber);
  }

  clearPhoneNumber() {
    _prefs?.remove(CorePrefConstants.prefPhoneNumber);
  }

  saveUserName(String name) {
    _prefs?.setString(CorePrefConstants.prefName, name);
  }

  String? getUserName() {
    return _prefs?.getString(CorePrefConstants.prefName);
  }

  clearUserName() {
    _prefs?.remove(CorePrefConstants.prefName);
  }

  saveLanguageCode(String code) {
    _prefs?.setString(CorePrefConstants.prefLanguageCode, code);
  }

  String getLanguageCode() {
    return _prefs?.getString(CorePrefConstants.prefLanguageCode) ??
        window.locale.languageCode;
  }
}
