import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter_news_app/components/NewsItemPage.dart';


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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(publisher, //it is a link (gesture detector?)
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      //opacity
                                    )),
                                Text(publishedAt),
                              ],
                            ),
                            Material(
                              color: Color(0x00FFFFFF),
                              child: IconButton(
                                icon:  Icon(Icons.import_contacts),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return NewsItemPage(
                                        publisher: publisher,
                                        author: author,
                                        title: title,
                                        description: description,
                                        urlToNews: urlToNews,
                                        urlToImage: urlToImage,
                                        publishedAt: publishedAt,
                                        content: content,
                                      );
                                    })
                                  );
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return portraitLayoutVariant(context);
  }
}
