import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_state.dart';
import 'package:flutter_news_app/redux/bookmarkedNews/bookmarkedNews_actions.dart';

BookmarkedNewsState bookmarkedNewsReducer(
    BookmarkedNewsState prevState, dynamic action) {

  if (action is ToggleIsBookmarked) {
    final chosenNewsPiece = action.chosenNewsPiece;
    List<NewsPieceData> newBookmarkedNewsList =
        List.from(prevState.bookmarkedNewsList);

    if ((prevState.bookmarkedNewsList.singleWhere(
            (newsPiece) => // the
                newsPiece.urlToNews == // test
                chosenNewsPiece.urlToNews, // condition
            orElse: () => null)) !=
        null) {
      //if didn't find an element passing the test returns null and makes whole if FALSE

      print('Already exists! Now will be removed!');
      newBookmarkedNewsList.removeWhere(
          (newsPiece) => newsPiece.urlToNews == chosenNewsPiece.urlToNews);
    } else {
      newBookmarkedNewsList.add(chosenNewsPiece);
      print('Added!');
    }
    return BookmarkedNewsState(bookmarkedNewsList: newBookmarkedNewsList);
  }

  return prevState;
}
