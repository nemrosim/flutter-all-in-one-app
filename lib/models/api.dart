import 'dart:convert';

import 'package:authapp/models/generated/serializers.dart';

import 'generated/item.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = 'https://www.reddit.com/r/popular/new.json?count=25';

Future<List<Post>> getAndParseRedditJsonData() async {
  final response = await http.get(Uri.parse(BASE_URL));

  Reddit reddit = serializers.deserializeWith(
      Reddit.serializer, json.decode(response.body));

  return reddit.data.children.map((Data data) => data.data).toList();
}
