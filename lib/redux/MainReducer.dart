import 'package:flutter_news_app/redux/AppState.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';

import 'allNews/allNews_reducer.dart';

// AppState mainReducer(AppState state, dynamic action) => AppState(
//   allNewsState: allNewsReducer(state.allNewsState, action), // ????
// );

AppState mainReducer(AppState state, dynamic action) {
  if (action is SetAllNewsStateAction) {
    final nextAllNewsState = allNewsReducer(state.allNewsState, action);

    return state.copyWith(allNewsState: nextAllNewsState);
  }

  return state;
}