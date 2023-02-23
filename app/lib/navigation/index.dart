import 'package:flutter/material.dart';
import '../screens/error/index.dart';
import '../screens/home/index.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }
}
