// CREATED SECOND
// import 'package:flutter_news_app/model/AppState.dart';
import 'package:flutter_news_app/model/Models.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';

void fetchAllNewsAction(Store store) async {
  if (store.state.allNewsList != null) return; //need an action for refresh

  final String apiUrl =
      'http://newsapi.org/v2/top-headlines?' +
          'country=us&' +
          'apiKey=3f1d580b86b6414e8be8098c17351375';

  final result = await http.get(apiUrl);
  Iterable news = json.decode(result.body)['articles'];
  List allNewsList = List //<NewsPieceData>
      .from(news).map((model) => NewsPieceData.fromJson(model)).toList();
  //TODO: handle fetch errors
  store.dispatch(FetchAllNewsSuccessAction(allNewsList));
}

class FetchAllNewsSuccessAction {
  final List<NewsPieceData> payload; //allNewsList
  FetchAllNewsSuccessAction(this.payload);
}
