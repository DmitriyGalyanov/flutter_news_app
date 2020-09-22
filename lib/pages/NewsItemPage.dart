import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/NewsPieceData.dart';
import 'package:flutter_news_app/redux/AppState.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_actions.dart';
// import 'package:flutter_redux/flutter_redux.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';
// import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

//TODO: add landscape layout
//TODO: fetch actual (whole) Content

class NewsItemPage extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String urlToNews;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String publisher;
  final bool isBookmarked;

  const NewsItemPage(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.urlToNews,
      this.urlToImage,
      @required this.publishedAt,
      @required this.content,
      @required this.publisher,
      this.isBookmarked = false});

  @override
  _NewsItemPageState createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  @override
  Widget build(BuildContext context) {
    // bool isBookmarked = widget.isBookmarked; //widget.isBookmarked; // ;
    var isBookmarked;
    if (Redux.store.state.bookmarkedNewsState.bookmarkedNewsList.singleWhere(
            (newsPiece) => newsPiece.urlToNews == widget.urlToNews,
            orElse: () => null) !=
        null) {
      setState(() {
        isBookmarked = true;
      });
    } else {
      setState(() {
        isBookmarked = false;
      });
    }
    void _handleBookmarkIconClick() {
      Redux.store.dispatch(ToggleIsBookmarked(NewsPieceData(
        publisher: widget.publisher,
        author: widget.author,
        title: widget.title,
        description: widget.description,
        urlToNews: widget.urlToNews,
        urlToImage: widget.urlToImage,
        publishedAt: widget.publishedAt,
        content: widget.content
      )));
      print(isBookmarked);
      print(widget.urlToNews);
      if (Redux.store.state.bookmarkedNewsState.bookmarkedNewsList.singleWhere(
              (newsPiece) => newsPiece.urlToNews == widget.urlToNews,
              orElse: () => null) !=
          null) {
        setState(() {
          isBookmarked = true;
        });
      } else {
        setState(() {
          isBookmarked = false;
        });
      }
    }

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.title, style: TextStyle(fontSize: 17.0)),
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
                widget.urlToImage,
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
                        Flexible(child: Text(widget.author)),
                        Material(
                          color: Color(0x00FFFFFF),
                          child: InkWell(
                            splashColor: Colors.red,
                            onTap: () {
                              _handleBookmarkIconClick();
                            },
                            child: Icon(
                                isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: isBookmarked ? Colors.green : null),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                              style: TextStyle(
                                  fontSize: 21.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text(widget.content,
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
                              Text(widget.publisher,
                                  //it is a link (gesture detector?)
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    //opacity
                                  )),
                              Text(widget.publishedAt),
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
    );
  }
}
