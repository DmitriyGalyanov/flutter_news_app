import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/model/Models.dart';

class AllNewsState {
  final List<NewsPieceData> allNewsList;
  final bool isLoading;
  final bool isError;

  AllNewsState({this.allNewsList, this.isLoading, this.isError});

  factory AllNewsState.initial() =>
      AllNewsState(isLoading: false, isError: false, allNewsList: const []);

  AllNewsState copyWith({
    @required bool isLoading,
    @required bool isError,
    @required List<NewsPieceData> allNewsList,
  }) {
    return AllNewsState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        allNewsList: allNewsList ?? this.allNewsList);
  }
}
