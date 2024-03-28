import 'package:flutter/material.dart';


enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';
const Locale ARABIC_LOCAL = Locale("ar");
const Locale ENGLISH_LOCAL = Locale("en");

const List<Locale> supportedLocales = [
  ENGLISH_LOCAL,
  ARABIC_LOCAL,
];

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

extension LanguageTypeLocalExtension on LanguageType {
  Locale getLocal() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH_LOCAL;
      case LanguageType.ARABIC:
        return ARABIC_LOCAL;
    }
  }
}

extension LanguageTypeNameExtension on LanguageType {
  String getName() {
    switch (this) {
      case LanguageType.ENGLISH:
        return "en";
      case LanguageType.ARABIC:
        return "ar";
    }
  }
}
