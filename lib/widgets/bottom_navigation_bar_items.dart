import 'package:flutter/material.dart';

import 'bottom_icon.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueGrey,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomIcon(
                icon: Icons.home,
                iconText: "Home",
              ),
              BottomIcon(
                padding: EdgeInsets.only(right: 30),
                icon: Icons.mail,
                iconText: "Mail",
              ),
              BottomIcon(
                padding: EdgeInsets.only(left: 30),
                icon: Icons.map,
                iconText: "Map",
              ),
              BottomIcon(
                icon: Icons.settings,
                iconText: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
