import 'package:flutter/material.dart';
import 'package:gorin_users/ui/pages/home_page.dart';
import 'package:gorin_users/ui/pages/login_page.dart';
import 'package:gorin_users/ui/pages/register_page.dart';
import 'package:gorin_users/ui/pages/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.id:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case HomePage.id:
      return MaterialPageRoute(builder: (_) => HomePage());
    case RegisterPage.id:
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case LoginPage.id:
      return MaterialPageRoute(builder: (_) => LoginPage());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
