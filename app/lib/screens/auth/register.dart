import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          'register page',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
