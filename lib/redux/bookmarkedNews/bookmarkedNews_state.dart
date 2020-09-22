import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/NewsPieceData.dart';

class BookmarkedNewsState {
  //TODO: it will have to be saved on user's device via something like redux-persist
  final List<NewsPieceData> bookmarkedNewsList;

  BookmarkedNewsState({this.bookmarkedNewsList});

  factory BookmarkedNewsState.initial() =>
      BookmarkedNewsState(bookmarkedNewsList: const []); //const [] //List<NewsPieceData>()

  // BookmarkedNewsState copyWith({
  //   @required List<NewsPieceData> bookmarkedNewsList,
  // }) {
  //   return BookmarkedNewsState(
  //       bookmarkedNewsList: bookmarkedNewsList.add(c) ?? this.bookmarkedNewsList);
  // }

  BookmarkedNewsState copy() {
    return BookmarkedNewsState(bookmarkedNewsList: this.bookmarkedNewsList);
  }

  BookmarkedNewsState addItem({@required NewsPieceData addingNewsPieceData}) {
    List<NewsPieceData> newBookmarkedNewsList = this.bookmarkedNewsList;
    newBookmarkedNewsList.add(addingNewsPieceData);
    return BookmarkedNewsState(bookmarkedNewsList: newBookmarkedNewsList);
    // return BookmarkedNewsState(bookmarkedNewsList: this.bookmarkedNewsList.add(NewsPieceData this.newsPieceData))
  }
}
