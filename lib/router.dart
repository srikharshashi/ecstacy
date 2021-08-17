import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/ui/screens/HomePage.dart';
import 'package:bloc_custom_firebase/ui/screens/login.dart';
import 'package:bloc_custom_firebase/ui/screens/front_page.dart';
import 'package:bloc_custom_firebase/ui/screens/register.dart';
import 'package:bloc_custom_firebase/ui/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (context) => FrontPage());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (context) => Home());
      case REGISTER_PAGE:
        return MaterialPageRoute(builder: (context) => Register());
      default:
        return null;
    }
  }
}
