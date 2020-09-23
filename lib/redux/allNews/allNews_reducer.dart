//CREATED THIRD

import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:redux/redux.dart';

AllNewsState setAllNewsStateReducer(
    AllNewsState prevState, SetAllNewsStateAction action) {
  final payload = action.allNewsState;
  return prevState.copyWith(
      isLoading: payload.isLoading,
      isError: payload.isError,
      allNewsList: payload.allNewsList);
}

Reducer<AllNewsState> allNewsReducer = combineReducers<AllNewsState>([
  TypedReducer<AllNewsState, SetAllNewsStateAction>(setAllNewsStateReducer),
]);
