import './bloc/provider.dart';
import 'localization/shareprefence.dart';
import './routes/custom_routes.dart';
import './routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/demo_localization.dart';

class App extends StatefulWidget {
  static void setLocale(context, Locale locale) {
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(locale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((
      locale,
    ) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: CircularProgressIndicator(),
      );
    } else {
      return Provider(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19',
        onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: splashScreenRoute,
        locale: _locale,
        localizationsDelegates: [
          Demolocalization.delegate,
          // app specific localization delegate here , eg. change language in date picker
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English ,
          const Locale('ne', 'NP') // nepali
        ],
        localeResolutionCallback: (devicelocale, supportedLocales) {
          for (var locales in supportedLocales) {
            if (locales.languageCode == devicelocale.languageCode &&
                locales.countryCode == devicelocale.countryCode) {
              return devicelocale;
            }
          }
          return supportedLocales.first;
        },
      ));
    }
  }
}
