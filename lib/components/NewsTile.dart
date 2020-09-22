import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/Models.dart';

import 'package:flutter_news_app/redux/AppState.dart';

import 'package:flutter_news_app/pages/NewsItemPage.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';

class NewsTile extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String urlToNews;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String publisher;

  // final bool isBookmarked;

  const NewsTile({
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.urlToNews,
    this.urlToImage,
    @required this.publishedAt,
    @required this.content,
    @required this.publisher,
    // this.isBookmarked = false
  });

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  Widget portraitLayoutVariant(BuildContext context) {
    bool isBookmarked = false;
    if (Redux.store.state.bookmarkedNewsState.bookmarkedNewsList.singleWhere(
            (newsPiece) => newsPiece.urlToNews == widget.urlToNews,
            orElse: () => null) !=
        null) {
      setState(() {
        isBookmarked = true;
      });
    }

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (BuildContext context, state) => Container(
          margin: EdgeInsets.only(bottom: 22.0),
          decoration: BoxDecoration(
              color: Color(0x88FFFFFF),
              border: Border.all(
                  color: Colors.black, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
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
                            // onTap: () => {},
                            onTap: () {
                              Redux.store.dispatch(ToggleIsBookmarked(
                                  NewsPieceData(
                                      publisher: widget.publisher,
                                      author: widget.author,
                                      title: widget.title,
                                      description: widget.description,
                                      urlToNews: widget.urlToNews,
                                      urlToImage: widget.urlToImage,
                                      publishedAt: widget.publishedAt,
                                      content: widget.content)));
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
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text(widget.content,
                              style: TextStyle(
                                fontSize: 14.0,
                                //opacity
                              )),
                          SizedBox(
                            height: 24.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.publisher,
                                      //it is a link (gesture detector?)
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        //opacity
                                      )),
                                  Text(widget.publishedAt),
                                ],
                              ),
                              Material(
                                color: Color(0x00FFFFFF),
                                child: IconButton(
                                  icon: Icon(Icons.import_contacts),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return NewsItemPage(
                                          publisher: widget.publisher,
                                          author: widget.author,
                                          title: widget.title,
                                          description: widget.description,
                                          urlToNews: widget.urlToNews,
                                          urlToImage: widget.urlToImage,
                                          publishedAt: widget.publishedAt,
                                          content: widget.content,
                                          isBookmarked: isBookmarked);
                                    }));
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return portraitLayoutVariant(context);
  }
}
