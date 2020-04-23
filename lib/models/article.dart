import 'package:flutter/material.dart';

class Article {
  final int _id;
  final Image _image;
  final String _title;
  final String _subtitle;
  final String _url;

  Article(
      {@required id,
      @required image,
      @required title,
      @required subtitle,
      @required url})
      : this._id = id,
        this._image = image,
        this._title = title,
        this._url = url,
        this._subtitle = subtitle;

  String get url => _url;

  String get subtitle => _subtitle;

  String get title => _title;

  Image get image => _image;

  int get id => _id;
}
