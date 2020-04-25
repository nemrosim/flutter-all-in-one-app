import 'dart:convert';

import 'package:built_value/built_value.dart';

List<int> parseTopStories(String jsonString) {
  /**
   * This will return a list of "dynamic"
   */
  final parsed = json.decode(jsonString);

  /**
   * Here we are converting to List of int-s
   */
  final listOfIds = List<int>.from(parsed);
  return listOfIds;

  throw UnimplementedError();
}

Item parseItem(String jsonStr) {
  final parsed = json.decode(jsonStr);
  return Item.fromJson(parsed);
}

class Item {
  int _id;
  String _by;
  int _descendants;

  Item({id, by, descendants})
      : this._id = id,
        this._by = by,
        this._descendants = descendants;

  factory Item.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Item(
      id: json['id'] ?? '[null]',
      by: json['by'] ?? '[null]',
      descendants: json['descendants'] ?? '[null]',
    );
  }

  int get descendants => this._descendants;

  set descendants(int value) {
    this._descendants = value;
  }

  String get by => this._by;

  set by(String value) {
    this._by = value;
  }

  int get id => this._id;

  set id(int value) {
    this._id = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _by == other._by &&
          _descendants == other._descendants;

  @override
  int get hashCode => _id.hashCode ^ _by.hashCode ^ _descendants.hashCode;
}
