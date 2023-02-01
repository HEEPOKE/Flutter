import 'package:flutter/material.dart';

const MyAppBar();

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('My App'),
          actions: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://picsum.photos/200'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}