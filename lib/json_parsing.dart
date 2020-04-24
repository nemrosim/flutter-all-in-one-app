import 'dart:convert';

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
//  throw UnimplementedError();
  final parsed = json.decode(jsonStr);
  return Item.fromJson(parsed);
}

class Item {
  final int id;
  final String by;
  final int descendants;

  Item({this.id, this.by, this.descendants});

  factory Item.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Item(
      id: json['id'] ?? '[null]',
      by: json['by'] ?? '[null]',
      descendants: json['descendants'] ?? '[null]',
    );
  }
}
