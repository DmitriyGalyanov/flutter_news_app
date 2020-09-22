import 'package:flutter_news_app/redux/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_actions.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_reducer.dart';

import 'allNews/allNews_reducer.dart';

// AppState mainReducer(AppState state, dynamic action) => AppState(
//   allNewsState: allNewsReducer(state.allNewsState, action), // ????
// );

AppState mainReducer(AppState state, dynamic action) {
  if (action is SetAllNewsStateAction) {
    final nextAllNewsState = allNewsReducer(state.allNewsState, action);
    return state.copyWith(allNewsState: nextAllNewsState);
  } else if (action is ToggleIsBookmarked) {
    print(action.chosenNewsPiece.content); print('test');
    final nextBookmarkedNewsState = bookmarkedNewsReducer(state.bookmarkedNewsState, action);
    return state.copyWith(bookmarkedNewsState: nextBookmarkedNewsState);
  }

  return state;
}