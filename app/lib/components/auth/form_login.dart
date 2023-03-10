import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/services/auth/login_services.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email OR Username',
                prefixIcon:
                    const Icon(Icons.person, color: Colors.deepPurpleAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon:
                    const Icon(Icons.lock, color: Colors.deepPurpleAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final result = await LoginService.post('/api/auth/login',
          {'username_or_email': email, 'password': password});

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
      } else {
        throw Exception(result['error']);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
