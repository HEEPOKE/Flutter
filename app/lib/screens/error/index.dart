import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          'error page',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
