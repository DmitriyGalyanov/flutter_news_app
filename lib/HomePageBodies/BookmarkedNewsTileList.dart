import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_state.dart';

//redux modules
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_news_app/redux/AppState.dart';

//custom components
import 'package:flutter_news_app/components/NewsTile.dart';

class BookmarkedNewsTileList extends StatelessWidget {
  final placeHolderImage =
      "https://image.shutterstock.com/z/stock-vector-disconnected-cable-text-warning-message-sorry-something-went-wrong-oops-error-page-vector-1298184715.jpg";

  Widget portraitLayout(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return StoreConnector<AppState, List<NewsPieceData>>(
      converter: (store) => store.state.bookmarkedNewsState.bookmarkedNewsList,
      builder: (context, bookmarkedNewsList) {
        // print(bookmarkedNewsList[0].content); print('test');
        if (bookmarkedNewsList.length == 0) {
          return Center(child: Text('No bookmarks yet'));
        } else
          return SizedBox(
              width: deviceData.size.width * 0.85,
              child: ListView.builder(
                  itemCount: bookmarkedNewsList != null
                      ? bookmarkedNewsList.length
                      : 1,
                  itemBuilder: (_, index) => NewsTile(
                    author: bookmarkedNewsList[index].author ??
                        'No Author provided',
                    title: bookmarkedNewsList[index].title ??
                        'No title provided',
                    description:
                    bookmarkedNewsList[index].description ??
                        'No description provided',
                    urlToNews: bookmarkedNewsList[index].urlToNews ??
                        'http://google.com/',
                    urlToImage:
                   bookmarkedNewsList[index].urlToImage ??
                        placeHolderImage,
                    publishedAt:
                    bookmarkedNewsList[index].publishedAt ??
                        'Publication time is not provided',
                    content: bookmarkedNewsList[index].content ??
                        'No content provided',
                    publisher: bookmarkedNewsList[index].publisher ??
                        'No publisher provided',
                  )));
      }, //state comes from converter
    );
  }

  @override
  Widget build(BuildContext context) {
    return portraitLayout(context);
  }
}
