import 'package:flutter/material.dart';
import 'navigation/index.dart';
import 'screens/home/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      initialRoute: AppRoutes.home,
      onGenerateRoute: generateRoute,
    );
  }
}
