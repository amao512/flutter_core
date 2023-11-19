import 'package:flutter/material.dart';

extension LocalExt on BuildContext {
  String get currentLanguageCode {
    return Localizations.localeOf(this).languageCode;
  }

  String get currentLanguage {
    String locale = Localizations.localeOf(this).languageCode;

    if (locale == 'en') {
      return "English";
    } else if (locale == 'ru') {
      return "Русский";
    }

    return "Қазақ";
  }
}

class LanguageCode {
  static const ru = 'ru';
  static const kk = 'kk';
  static const en = 'en';
}