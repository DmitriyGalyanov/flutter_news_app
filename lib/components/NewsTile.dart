import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math';

//TODO: LINKS VIA GESTURE DETECTORS?
//TODO: NAVIGATION TO SINGLE POST
//TODO: ADD ABILITY TO BOOKMARK POSTS
//TODO: ADD BOTTOM BAR WITH BUTTON LEADING TO BOOKMARKS
//TODO: ADD SORTING

class NewsTile extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String urlToNews;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String publisher;

  const NewsTile(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.urlToNews,
      this.urlToImage,
      @required this.publishedAt,
      @required this.content,
      @required this.publisher});

  Widget portraitLayoutVariant(BuildContext context) {
    // final regEx = RegExp(r"^https?:\/\/w?w?w?\.?.+\..+[^\/]$");
    // var test = regEx.firstMatch(urlToNews);
    // if (test != null) print(test.group(0));

    final deviceData = MediaQuery.of(context);
    return Container(
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
                urlToImage,
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
                      Flexible(child: Text(author)),
                      Icon(Icons.bookmark_border)
                    ],
                  ),
                  SizedBox(
                    height: 8.0
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 8.0
                        ),
                        Text(content,
                            style: TextStyle(
                              fontSize: 14.0,
                              //opacity
                            )),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text(publisher, //it is a link (gesture detector?)
                            style: TextStyle(
                              fontSize: 14.0,
                              //opacity
                            )),
                        Text(publishedAt),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return portraitLayoutVariant(context);
  }
}
