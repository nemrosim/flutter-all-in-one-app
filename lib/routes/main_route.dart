import 'package:authapp/models/article.dart';
import 'package:authapp/widgets/bottom_navigation_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:url_launcher/url_launcher.dart';

var faker = new Faker();

class MainRoute extends StatelessWidget {
  final List<Article> articles = List.generate(
    20,
    (index) => new Article(
      id: index,
      image: Image.asset('assets/images/shield.png'),
      title: faker.lorem.sentence(),
      subtitle: '${faker.lorem.sentence()} ${faker.lorem.sentence()}',
      url: 'https://medium.com/@artem.diashkin',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: articles.map(_buildArticle).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[800],
        onPressed: () {},
        child: Icon(
          Icons.account_circle,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildArticle(Article e) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white10,
        child: ListTile(
          contentPadding: EdgeInsets.all(5),
          dense: true,
          onTap: () async {
            if (await canLaunch(e.url)) {
              await launch(e.url);
            } else {
              throw 'Could not launch ${e.url}';
            }
          },
          leading: e.image,
          title: Text(
            e.title,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(e.subtitle),
          trailing: Icon(Icons.settings),
        ),
      ),
    );
  }
}
