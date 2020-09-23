import 'package:flutter_news_app/redux/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_actions.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_reducer.dart';

import 'allNews/allNews_reducer.dart';

AppState mainReducer(AppState state, dynamic action) => AppState(
  allNewsState: allNewsReducer(state.allNewsState, action),
  bookmarkedNewsState: bookmarkedNewsReducer(state.bookmarkedNewsState, action),
);