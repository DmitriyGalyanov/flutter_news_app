import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/Models.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

//redux modules
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_news_app/model/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_reducers.dart';

//custom components
import 'package:flutter_news_app/components/NewsTile.dart';

//TODO: IT CAN TAKE A PROP WHICH WILL 'DECIDE' IF IT'S AN AllNewsList OR BOOKMARKS LIST

class NewsTileList extends StatelessWidget {

  final placeHolderImage =
      "https://image.shutterstock.com/z/stock-vector-disconnected-cable-text-warning-message-sorry-something-went-wrong-oops-error-page-vector-1298184715.jpg";

  Widget portraitLayout(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return StoreConnector<AppState, AppState>(
      //<input, output>
      converter: (store) => store.state,
      builder: (context, state) {
        //'state' is coming from converter
        if (state.allNewsList == null) {
          // dispatch fetchAllNewsAction
          return Center(child: CircularProgressIndicator());
        }
        return SizedBox(
            width: deviceData.size.width * 0.85,
            child: ListView.builder(
                itemCount:
                    state.allNewsList != null ? state.allNewsList.length : 0,
                itemBuilder: (_, index) => NewsTile(
                      author: state.allNewsList[index].author ??
                          'No Author provided',
                      title:
                          state.allNewsList[index].title ?? 'No title provided',
                      description: state.allNewsList[index].description ??
                          'No description provided',
                      urlToNews: state.allNewsList[index].urlToNews ??
                          'http://google.com/',
                      urlToImage: state.allNewsList[index].urlToImage ??
                          placeHolderImage,
                      publishedAt: state.allNewsList[index].publishedAt ??
                          'Publication time is not provided',
                      content: state.allNewsList[index].content ??
                          'No content provided',
                      publisher: state.allNewsList[index].publisher ??
                          'No publisher provided',
                    )));
      }, //state comes from converter
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<NewsPieceData>>(
        onInit: (store) {
          store.dispatch(fetchAllNewsAction);
        },
        converter: (store) => store.state.allNewsList,
        builder: (build, state) {
          switch (MediaQuery.of(context).orientation) {
            case Orientation.portrait:
              return portraitLayout(context);
            // case Orientation.landscape: return landscapeLayout(context);
            default:
              return portraitLayout(context);
          }
        });
  }
}
