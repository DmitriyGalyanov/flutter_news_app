//CREATED THIRD
//
// import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
//
// AppState reducer(AppState prevState, dynamic action) {
//   AppState newState = prevState;
//   if (action is FetchAllNewsSuccessAction) {
//     newState.allNewsList = action.payload;
//   }
//   return newState;
// }

import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';

//TODO: REFACTOR (NAMES, CONDITIONS)

// AllNewsState allNewsReducer(AllNewsState prevState, dynamic action) {
  //setAllNewsStateAction
  // AllNewsState newState = prevState.copyWith(isLoading: null, isError: null, allNewsList: null);
  // if (action is FetchAllNewsSuccessAction) { //setAllNewsStateAction
  //   newState.allNewsList = action.payload;
  // }
  // return newState;
// }
AllNewsState allNewsReducer(AllNewsState prevState, SetAllNewsStateAction action) {
  final payload = action.allNewsState;
  return prevState.copyWith(
      isLoading: payload.isLoading,
      isError: payload.isError,
      allNewsList: payload.allNewsList);
}
