import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/Models.dart';

//TODO: split (combine) reducers
//TODO: create slices

class AllNewsState {
  final List<NewsPieceData> allNewsList;
  final bool isLoading;
  final bool isError;

  AllNewsState({this.allNewsList, this.isLoading, this.isError});

  factory AllNewsState.initial() =>
      AllNewsState(
          isLoading: false,
          isError: false,
          allNewsList: const []
      );

  // get allNewsState => this.allNewsState;

  AllNewsState copyWith({
    @required bool isLoading,
    @required bool isError,
    @required List<NewsPieceData> allNewsList,
  }) {
    return AllNewsState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      allNewsList: allNewsList ?? this.allNewsList
    );
  }

  // static List<NewsPieceData> listFromJson(List json) {
  //   return json == null ? List<NewsPieceData>() : json.map((model) => NewsPieceData.fromJson(model)).toList();
  // }
}
