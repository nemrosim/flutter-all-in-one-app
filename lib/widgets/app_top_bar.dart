import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  AppTopBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('First Route'),
      backgroundColor: Colors.blueGrey,
    );
  }
}
