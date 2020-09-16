import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_news_app/components/NewsTile.dart';

class NewsTileList extends StatelessWidget {
  final Future newsFuture;
  const NewsTileList({
    @required this.newsFuture});

  final placeHolderImage = "https://image.shutterstock.com/z/stock-vector-disconnected-cable-text-warning-message-sorry-something-went-wrong-oops-error-page-vector-1298184715.jpg";
  // not sure if that's the correct place to fetch data
  // final String apiUrl =
  //     'http://newsapi.org/v2/top-headlines?' +
  //     'country=us&' +
  //     'apiKey=3f1d580b86b6414e8be8098c17351375';
  //
  // Future fetchNews() async {
  //   var result = await http.get(apiUrl);
  //   return json.decode(result.body)['articles'];
  // }


  Widget portraitLayout(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return SizedBox(
      width: deviceData.size.width * 0.85,
      child: FutureBuilder(
        // future: fetchNews(),
        future: newsFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final isBookmarked = true; //TODO: ADD CHECK FOR THAT
                return NewsTile(
                  publisher: snapshot.data[index]['source']['name'] != null ?
                    snapshot.data[index]['source']['name'] : 'No publisher specified',
                  author: snapshot.data[index]['author'] != null ?
                    snapshot.data[index]['author'] : 'No author specified',
                  title: snapshot.data[index]['title'] != null ?
                    snapshot.data[index]['title'] : 'No title provided',
                  description: snapshot.data[index]['description'] != null ?
                    snapshot.data[index]['description'] : 'No description provided',
                  urlToNews: snapshot.data[index]['url'] != null ?
                    snapshot.data[index]['url'] : 'http://google.com/',
                  urlToImage: snapshot.data[index]['urlToImage'] != null ?
                    snapshot.data[index]['urlToImage'] : placeHolderImage,
                  // urlToImage: snapshot.data[index]['urlToImage'],
                  publishedAt: snapshot.data[index]['publishedAt'] != null ?
                    snapshot.data[index]['publishedAt'] : 'No publish time provided',
                  content: snapshot.data[index]['content'] != null ?
                    snapshot.data[index]['content'] : 'No content provided',
                  // isBookmarked: isBookmarked,
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(MediaQuery.of(context).orientation) {
      case Orientation.portrait: return portraitLayout(context);
      // case Orientation.landscape: return landscapeLayout(context);
      default: return portraitLayout(context);
    }

  }
}
