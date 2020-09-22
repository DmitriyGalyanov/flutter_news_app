// CREATED SECOND
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/model/Models.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';

Future<void> fetchAllNewsAction(Store store) async {
  // if (store.state.allNewsList != null) return; //need an action for refresh

  store.dispatch(
      SetAllNewsStateAction(AllNewsState(isLoading: true, isError: false)));

  final String apiUrl = 'http://newsapi.org/v2/top-headlines?' +
      'country=us&' +
      'apiKey=3f1d580b86b6414e8be8098c17351375';

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
}

class SetAllNewsStateAction {
  final AllNewsState allNewsState;

  SetAllNewsStateAction(this.allNewsState);
}
