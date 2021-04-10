import 'package:corona/src/screens/news_field.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../screens/about_us.dart';
import '../screens/faq.dart';
import '../screens/home_screen.dart';
import '../screens/infected_country_list.dart';
import '../screens/nepal_details..dart';
import '../screens/splash_screen.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
        break;
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutUs());
        break;

      case infected_country_listRoute:
        return MaterialPageRoute(builder: (_) => InfectedCountryList());
        break;
      case nepalDetailsRoute:
        return MaterialPageRoute(builder: (_) => NepalDetails());
        break;
      case faqRoute:
        return MaterialPageRoute(builder: (_) => FAQ());
        break;
      case newsRoute:
        return MaterialPageRoute(builder: (_) => NewsField());
    }
    return null;
  }
}
