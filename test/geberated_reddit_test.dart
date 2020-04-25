import 'package:authapp/json_parsing.dart';
import 'package:authapp/models/api.dart';
import 'package:authapp/models/generated/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("parses generated.json", () async {
    List<Post> result = await getAndParseRedditJsonData();
//    expect(() => parseTopStories(jsonString).first, throwsUnimplementedError);

    print(result.first.author);

    new Post((b) => b
      ..author = 'yashsaini9127'
      ..url = "https://some-url"
      ..title = 'What will you choose'
      ..ups = 1);
  });

  test("parses items.json", () {
    const jsonString =
        '{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8917,8952,8884,8887,8869,8958,8940,8908,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}';
//    expect(() => parseItem(jsonString), throwsUnimplementedError);

    expect(parseItem(jsonString).by, 'dhouston');
  });
}
