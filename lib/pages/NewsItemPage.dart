import 'package:flutter/material.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';
// import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

//TODO: add landscape layout

class NewsItemPage extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String urlToNews;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String publisher;

  const NewsItemPage(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.urlToNews,
      this.urlToImage,
      @required this.publishedAt,
      @required this.content,
      @required this.publisher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(title, style: TextStyle(fontSize: 17.0)),
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor
        ]),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Color(0xAAFFFFFF),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
        child: Center(
            child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(
                urlToImage,
                loadingBuilder: (BuildContext context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),
            ),
            Column(children: [
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(author)),
                        Icon(Icons.bookmark_border)
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: TextStyle(
                                  fontSize: 21.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text(content,
                              style: TextStyle(
                                fontSize: 18.0,
                                //opacity
                              )),
                          SizedBox(
                            height: 24.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(publisher,
                                  //it is a link (gesture detector?)
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    //opacity
                                  )),
                              Text(publishedAt),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ],
        )),
      ),
      // bottomNavigationBar: GradientBottomNavigationBar(
      //   backgroundColorStart: Theme.of(context).accentColor,
      //   backgroundColorEnd: Theme.of(context).primaryColor,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.collections_bookmark), title: Text('Bookmarks')),
      //   ],
      // ),
    );
  }
}
