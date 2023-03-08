import 'package:app/widgets/app_bar.dart';
import 'package:app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home'),
            const SizedBox(height: 72),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/form"),
                child: const Text('Go to form Screen')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
