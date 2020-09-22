import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/NewsPieceData.dart';

class BookmarkedNewsState {
  //TODO: it will have to be saved on user's device via something like redux-persist
  final List<NewsPieceData> bookmarkedNewsList;

  BookmarkedNewsState({this.bookmarkedNewsList});

  factory BookmarkedNewsState.initial() =>
      BookmarkedNewsState(bookmarkedNewsList: List<NewsPieceData>()); //const []

  BookmarkedNewsState copy({
    @required List<NewsPieceData> bookmarkedNewsList,
  }) {
    return BookmarkedNewsState(
        bookmarkedNewsList: bookmarkedNewsList ?? this.bookmarkedNewsList);
  }
}
