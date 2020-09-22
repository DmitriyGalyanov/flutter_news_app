// CREATED FIRST

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/MainReducer.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

//TODO: split (combine) reducers

class AppState {
  final AllNewsState allNewsState;

  AppState({
    @required this.allNewsState,
  });

  AppState copyWith({
    AllNewsState allNewsState,
  }) {
    return AppState(
      allNewsState: allNewsState ?? this.allNewsState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final allNewsStateInitial = AllNewsState.initial();

    _store = Store<AppState>(mainReducer,
        middleware: [thunkMiddleware],
        initialState: AppState(allNewsState: allNewsStateInitial));
  }
}
