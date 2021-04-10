import 'package:corona/src/classes/language.dart';
import 'package:corona/src/localization/shareprefence.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class Dropdownbtn extends StatelessWidget {
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) async {
      Locale _temp = await setLocales(language.languageCode);

      setLanguageName(language.name);

      App.setLocale(context, _temp);
    }

    return DropdownButton(
        onChanged: (Language language) {
          _changeLanguage(language);
        },
        elevation: 0,
        icon: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              FutureBuilder(
                future: getString(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  );
                },
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              )
            ],
          ),
        ),
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(lang.flag), Text(lang.name)],
                  ),
                ))
            .toList());
  }
}
