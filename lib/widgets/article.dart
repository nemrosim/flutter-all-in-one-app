import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.cyanAccent,
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam elementum dolor eget lorem euismod rutrum.',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
