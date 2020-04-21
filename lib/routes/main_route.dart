import 'package:authapp/widgets/article.dart';
import 'package:authapp/widgets/bottom_navigation_bar_items.dart';
import 'package:flutter/material.dart';

class MainRoute extends StatelessWidget {
  final List<Widget> articles = [
    Article(),
    Article(),
    Article(),
    Article(),
    Article(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: articles,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: Icon(
          Icons.account_circle,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
