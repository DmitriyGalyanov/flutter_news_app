//CREATED THIRD

import 'package:flutter_news_app/model/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  // AppState newState = AppState.fromAppState(prevState);
  AppState newState = prevState;
  if (action is FetchAllNewsSuccessAction) {
    // newState.allNewsList = action.payload;
    //   newState.allNewsListFuture = action.payload;
    newState.allNewsList = action.payload;
  }
  return newState;
}