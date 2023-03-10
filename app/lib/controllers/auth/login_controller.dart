import 'package:flutter/material.dart';
import 'package:app/navigation/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/services/auth/login_services.dart';

Future<void> handleLogin(BuildContext context, String email, String password,
    Function showError) async {
  try {
    final result = await LoginService.post(
        '/api/auth/login', {'username_or_email': email, 'password': password});

    if (result['success']) {
      final data = result['payload']['payload'];
      final userId = data['userId'];
      final role = data['role'];
      final token = data['token'];
      final exp = data['exp'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userId);
      prefs.setString('role', role);
      prefs.setString('token', token);
      prefs.setString('exp', exp.toString());
      String? storedToken = prefs.getString('token');
      String? storedUserId = prefs.getString('userId');
      String? storedExp = prefs.getString('exp');

      Navigator.pushNamed(context, AppRoutes.home);
    } else {
      showError(result['error']);
    }
  } catch (e) {
    print(e);
  }
}
