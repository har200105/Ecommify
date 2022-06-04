import 'package:ecommify/services/auth/screens/auth.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => AuthScreen());
    default:
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
                  body: Center(
                child: Text('Screen Doesn\'t exist'),
              )));
  }
}
