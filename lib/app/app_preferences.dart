import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../injection_container.dart';
import '../resources/localization/language_manager.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString("LOCAL");
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return '';
    }
  }
  Future<Locale?> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    }
    if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      return ENGLISH_LOCAL;
    } else {
      return null;
    }
  }

  Future<Locale> switchAppLanguage(LanguageType languageType) async {
    Locale? currentLanguage = await getLocal();
    if (currentLanguage != languageType.getLocal()) {
      if (languageType == LanguageType.ARABIC) {
        await _sharedPreferences.setString(
            "LOCAL", LanguageType.ARABIC.getValue());
        await resetAllModules();
        return ARABIC_LOCAL;
      } else {
        await _sharedPreferences.setString(
            "LOCAL", LanguageType.ENGLISH.getValue());
        await resetAllModules();
        return ENGLISH_LOCAL;
      }
    } else {
      return languageType.getLocal();
    }
  }

}
