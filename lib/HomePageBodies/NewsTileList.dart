import 'package:flutter/material.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';

//redux modules
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_news_app/redux/AppState.dart';

//custom components
import 'package:flutter_news_app/components/NewsTile.dart';

class NewsTileList extends StatelessWidget {
  final placeHolderImage =
      "https://image.shutterstock.com/z/stock-vector-disconnected-cable-text-warning-message-sorry-something-went-wrong-oops-error-page-vector-1298184715.jpg";

  Widget portraitLayout(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return StoreConnector<AppState, AllNewsState>(
      //<input, output>
      converter: (store) => store.state.allNewsState,
      builder: (context, allNewsState) {
        //'state' is coming from converter
        if (allNewsState.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else if (allNewsState.isError == true) {
          return Center(child: Text('Something went wrong, refresh please'));
          //some error note
        } else
          return SizedBox(
              width: deviceData.size.width * 0.85,
              child: ListView.builder(
                  itemCount: allNewsState.allNewsList != null
                      ? allNewsState.allNewsList.length
                      : 0,
                  itemBuilder: (_, index) => NewsTile(
                        author: allNewsState.allNewsList[index].author ??
                            'No Author provided',
                        title: allNewsState.allNewsList[index].title ??
                            'No title provided',
                        description:
                            allNewsState.allNewsList[index].description ??
                                'No description provided',
                        urlToNews: allNewsState.allNewsList[index].urlToNews ??
                            'http://google.com/',
                        urlToImage:
                            allNewsState.allNewsList[index].urlToImage ??
                                placeHolderImage,
                        publishedAt:
                            allNewsState.allNewsList[index].publishedAt ??
                                'Publication time is not provided',
                        content: allNewsState.allNewsList[index].content ??
                            'No content provided',
                        publisher: allNewsState.allNewsList[index].publisher ??
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
