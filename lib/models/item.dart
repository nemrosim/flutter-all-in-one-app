import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'item.g.dart';

/**
 *
 */
abstract class Reddit implements Built<Reddit, RedditBuilder> {
  Children get data;

  Reddit._();
  factory Reddit([void Function(RedditBuilder) updates]) = _$Reddit;

  static Serializer<Reddit> get serializer => _$redditSerializer;
}

/**
 *
 */
abstract class Children implements Built<Children, ChildrenBuilder> {
  BuiltList<Data> get children;

  Children._();
  factory Children([void Function(ChildrenBuilder) updates]) = _$Children;
}

/**
 *
 */
abstract class Data implements Built<Data, DataBuilder> {
  Post get data;

  Data._();
  factory Data([void Function(DataBuilder) updates]) = _$Data;
}

/**
 *
 */
abstract class Post implements Built<Post, PostBuilder> {
  String get author;
  String get url;
  String get title;
  int get ups;

  Post._();
  factory Post([void Function(PostBuilder) updates]) = _$Post;
}
