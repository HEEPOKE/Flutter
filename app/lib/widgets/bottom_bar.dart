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
      color: Colors.deepPurpleAccent,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              icon: const Icon(Icons.arrow_left, size: 40),
              color: Colors.white,
              onPressed: () => navigateToSearch(context),
            ),
          ),
          SizedBox(
            width: 50,
            height: 35,
            child: IconButton(
              icon: const Icon(Icons.home),
              color: Colors.white,
              onPressed: () => navigateToHome(context),
            ),
          ),
          SizedBox(
            width: 50,
            height: 35,
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.white,
              onPressed: () => navigateToSettings(context),
            ),
          ),
        ],
      ),
    );
  }
}
