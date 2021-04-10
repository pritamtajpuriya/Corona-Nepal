import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demolocalization {
  final Locale locale;
  Demolocalization(this.locale);
  static Demolocalization of(BuildContext context) {
    return Localizations.of<Demolocalization>(context, Demolocalization);
  }

  Map<String, String> _localizedValue;

  Future load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/src/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValue = mappedJson.map((key, value) => MapEntry(key, value));
  }

  String getTranslatedValue(String key) {
    return _localizedValue[key];
  }

  static const LocalizationsDelegate<Demolocalization> delegate =
      _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate
    extends LocalizationsDelegate<Demolocalization> {
  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ne'].contains(locale.languageCode);
  }

  @override
  Future<Demolocalization> load(Locale locale) async {
    Demolocalization localization = new Demolocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}
