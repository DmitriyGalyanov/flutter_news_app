// CREATED SECOND
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/model/Models.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// Future<void> fetchAllNewsAction(Store store) async {
//
//   store.dispatch(
//       SetAllNewsStateAction(AllNewsState(isLoading: true, isError: false)));
//
//   final String apiUrl = 'http://newsapi.org/v2/top-headlines?' +
//       'country=us&' +
//       'apiKey=3f1d580b86b6414e8be8098c17351375';
//
//   try {
//     final response = await http.get(apiUrl);
//     final jsonData = json.decode(response.body)['articles'];
//     store.dispatch(SetAllNewsStateAction(AllNewsState(
//         isLoading: false,
//         isError: false,
//         allNewsList: NewsPieceData.listFromJson(jsonData))));
//   } catch (error) {
//     store.dispatch(
//         SetAllNewsStateAction(AllNewsState(isLoading: false, isError: true)));
//   }
// }

ThunkAction fetchAllNewsAction() {
  final String apiUrl = 'http://newsapi.org/v2/top-headlines?' +
      'country=us&' +
      'apiKey=3f1d580b86b6414e8be8098c17351375';
  return (Store store) async {
    Future(() async {
      store.dispatch(
          SetAllNewsStateAction(AllNewsState(isLoading: true, isError: false)));
      try {
        final response = await http.get(apiUrl);
        final jsonData = json.decode(response.body)['articles'];
        store.dispatch(SetAllNewsStateAction(AllNewsState(
            isLoading: false,
            isError: false,
            allNewsList: NewsPieceData.listFromJson(jsonData))));
      } catch (error) {
        store.dispatch(
            SetAllNewsStateAction(AllNewsState(isLoading: false, isError: true)));
      }
    });
  };
}

class SetAllNewsStateAction {
  final AllNewsState allNewsState;

  SetAllNewsStateAction(this.allNewsState);
}
