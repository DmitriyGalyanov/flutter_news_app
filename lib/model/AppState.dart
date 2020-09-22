// CREATED FIRST

// import 'package:flutter/material.dart';

import 'package:flutter_news_app/model/Models.dart';

//TODO: split (combine) reducers
//TODO: create slices

class AppState {
  List<NewsPieceData> allNewsList;
  // those variables are store.state fields
  AppState(
      {
        this.allNewsList,
      });
  //we can define default values
}
