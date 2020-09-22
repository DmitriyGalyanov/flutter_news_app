// CREATED FIRST

// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';

//TODO: split (combine) reducers
//TODO: create slices

// class AppState {
//   List<NewsPieceData> allNewsList;
//   // those variables are store.state fields
//   AppState(
//       {
//         this.allNewsList,
//       });
//   //we can define default values
// }

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

  // static AllNewsState get allNewsState => this.allNewsState;
}
