import 'package:app/screens/auth/login.dart';
import 'package:app/screens/auth/register.dart';
import 'package:app/screens/error/index.dart';
import 'package:app/screens/home/index.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
