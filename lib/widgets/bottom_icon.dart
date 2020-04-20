import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final String _iconText;
  final IconData _icon;
  final EdgeInsetsGeometry _padding;

  BottomIcon({@required iconText, @required icon, padding})
      : this._iconText = iconText,
        this._icon = icon,
        this._padding = padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding ?? EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {},
            child: IconButton(
              onPressed: () {
                print('Icon Button Clicked');
              },
              padding: EdgeInsets.all(0),
              icon: Icon(
                _icon,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            _iconText,
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
