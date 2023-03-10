import 'package:flutter/material.dart';
import 'package:app/common/common_textfield.dart';
import 'package:app/controllers/auth/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _loginError;

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
            CommonTextField(
              controller: _passwordController,
              hintText: 'Password',
              prefixIcon: Icons.lock,
              errorText: _loginError.isNotEmpty
                  ? 'Username or Email is incorrect'
                  : '',
            ),
            const SizedBox(height: 16.0),
            CommonTextField(
              controller: _emailController,
              hintText: 'Email OR Username',
              prefixIcon: Icons.person,
              errorText: _loginError.isNotEmpty ? 'password is incorrect' : '',
            ),
            const SizedBox(height: 16.0),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        await handleLogin(context, _emailController.text,
            _passwordController.text, showError);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text('Login'),
    );
  }

  void showError(String errorMessage) {
    setState(() {
      _loginError = errorMessage;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
