import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Screen')),
      body: const Center(child: Text('Hello, world!')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }

  void navigateToSearch(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  void navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => navigateToHome(context),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => navigateToSearch(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => navigateToSettings(context),
          ),
        ],
      ),
    );
  }
}
