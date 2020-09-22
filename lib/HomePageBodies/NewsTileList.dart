import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

//redux modules
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_news_app/redux/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_reducer.dart';

//custom components
import 'package:flutter_news_app/components/NewsTile.dart';

//TODO: IT CAN TAKE A PROP WHICH WILL 'DECIDE' IF IT'S AN AllNewsList OR BOOKMARKS LIST

class NewsTileList extends StatelessWidget {

  final placeHolderImage =
      "https://image.shutterstock.com/z/stock-vector-disconnected-cable-text-warning-message-sorry-something-went-wrong-oops-error-page-vector-1298184715.jpg";

  Widget portraitLayout(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return StoreConnector<AppState, AllNewsState>(
      //<input, output>
      // rebuildOnChange: true,
      // return StoreConnector<AppState, List<NewsPieceData>>(
      // distinct: true,
      // onInit: (store) {
      //   store.dispatch(fetchAllNewsAction);
      // },
      converter: (store) => store.state.allNewsState, //take allNewsState instead of all state
      builder: (context, state) {
        //'state' is coming from converter
        // if (state.allNewsList == null) {
        // if (state.allNewsState.allNewsList.length == 0) {
        // if (state.allNewsState.isError == false && state.allNewsState.isLoading == false) {
        //   return Text('tesssst');
        // }
        if (state.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        } else if (state.isError == true) {
          return Center(child: Text('Something went wrong, refresh please'));
          //some error note
        } else
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
    return portraitLayout(context);
    // return StoreConnector<AppState, List<NewsPieceData>>(
    //     onInit: (store) {
    //       store.dispatch(fetchAllNewsAction);
    //     },
    //     // onInitialBuild: ,
    //     converter: (store) => store.state.allNewsState.allNewsList,
    //     builder: (build, state) {
    //       switch (MediaQuery.of(context).orientation) {
    //         case Orientation.portrait:
    //           return portraitLayout(context);
    //         // case Orientation.landscape: return landscapeLayout(context);
    //         default:
    //           return portraitLayout(context);
    //       }
    //     });
  }
}
