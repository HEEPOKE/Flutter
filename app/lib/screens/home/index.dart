import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          'Hello, world!',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
