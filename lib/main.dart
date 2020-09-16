import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

import 'package:flutter_news_app/components/NewsTileList.dart';

void main() {
  runApp(MyApp());
}

//TODO: LINKS VIA GESTURE DETECTORS?
//TODO: NAVIGATION TO SINGLE POST
//TODO: ADD ABILITY TO BOOKMARK POSTS
//TODO: ADD BOTTOM BAR WITH BUTTON LEADING TO BOOKMARKS
//TODO: ADD SORTING
//TODO: ADD 3RD BUTTON TO BOTTOM NAV BAR
//TODO: MOVE FETCH FROM NewsTileList TO MAIN

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

      },
      title: 'Simple News App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
        accentColor: Colors.purpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class NewsTileData {
  String author;
  String title;
  String description;
  String urlToNews;
  String urlToImage;
  String publishedAt;
  String content;
  String publisher;
}

class _MyHomePageState extends State<MyHomePage> {
  final bookmarkedNews = <NewsTileData>[];

  final String apiUrl =
      'http://newsapi.org/v2/top-headlines?' +
          'country=us&' +
          'apiKey=3f1d580b86b6414e8be8098c17351375';

  Future fetchNews() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['articles'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.title),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ]
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft
          )
        ),
        child: Center(
          child: NewsTileList(newsFuture: fetchNews())
        ),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Theme.of(context).accentColor,
        backgroundColorEnd: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark), title: Text('Bookmarks')),
        ],
      ),
    );
  }
}
