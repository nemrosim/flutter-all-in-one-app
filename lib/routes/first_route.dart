import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'First page body',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                // Navigate to second route when tapped.
              },
            ),
          ],
        ),
      ),
    );
  }
}
