import 'dart:ui';

import 'package:flutter_core/core/data/constants/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityDataSource {
  SharedPreferences? sharedPreferences;

  SecurityDataSource({
    required this.sharedPreferences,
  });

  saveAccessToken(String token) {
    sharedPreferences?.setString(CorePrefConstants.prefToken, token);
  }

  String? getAccessToken() {
    return sharedPreferences?.getString(CorePrefConstants.prefToken);
  }

  bool isAuthorized() {
    return sharedPreferences
            ?.getString(CorePrefConstants.prefToken)
            ?.isNotEmpty ==
        true;
  }

  clearAccessToken() {
    sharedPreferences?.remove(CorePrefConstants.prefToken);
  }

  saveRefreshToken(String token) {
    sharedPreferences?.setString(CorePrefConstants.prefRefreshToken, token);
  }

  clearRefreshToken() {
    sharedPreferences?.remove(CorePrefConstants.prefRefreshToken);
  }

  String? getRefreshToken() {
    return sharedPreferences?.getString(CorePrefConstants.prefRefreshToken);
  }

  savePhoneNumber(String phoneNumber) {
    sharedPreferences?.setString(
        CorePrefConstants.prefPhoneNumber, phoneNumber);
  }

  String? getPhoneNumber() {
    return sharedPreferences?.getString(CorePrefConstants.prefPhoneNumber);
  }

  clearPhoneNumber() {
    sharedPreferences?.remove(CorePrefConstants.prefPhoneNumber);
  }

  saveLanguageCode(String code) {
    sharedPreferences?.setString(CorePrefConstants.prefLanguageCode, code);
  }

  String getLanguageCode() {
    return sharedPreferences?.getString(CorePrefConstants.prefLanguageCode) ??
        window.locale.languageCode;
  }
}
