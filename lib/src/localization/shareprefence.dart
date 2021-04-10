import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return Demolocalization.of(context).getTranslatedValue(key);
}

//language code
const String english = 'en';

const String nepali = 'ne';

const String LANGUAGE_CODE = 'languageCode';
String name;

// store Name Of Language For Show Which language is showing
// SharePreference

Future<void> setLanguageName(String name) async {
  final localStorage = await SharedPreferences.getInstance();
  localStorage.setString('languageNamee', name);
}

Future<String> getString() async {
  final localStorage = await SharedPreferences.getInstance();
  name = localStorage.getString('languageNamee') ?? 'English';
  return name;
}
// store local for storing Language

Future<Locale> setLocales(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;

  switch (languageCode) {
    case english:
      _temp = Locale(languageCode, 'US');
      break;
    case nepali:
      _temp = Locale(languageCode, 'NP');
      break;
    default:
      _temp = Locale(english, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? english;
  return _locale(languageCode);
}
