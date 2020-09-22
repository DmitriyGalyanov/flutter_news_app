import 'package:flutter/material.dart';
import 'package:flutter_news_app/redux/MainReducer.dart';
import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';
import 'package:flutter_news_app/redux/allNews/allNews_state.dart';

//additional modules
// import 'package:http/http.dart' as http;
// import 'dart:convert';

//Redux modules
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

import 'package:flutter_news_app/redux/AppState.dart';

// import 'package:flutter_news_app/model/Models.dart';
import 'package:flutter_news_app/redux/allNews/allNews_reducer.dart';
// import 'package:flutter_news_app/redux/allNews/allNews_actions.dart';

//custom 3rd-party components
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

//custom components
//home page bodies
import 'package:flutter_news_app/HomePageBodies/NewsTileList.dart';

void main() {
  runApp(MyApp());
}

//TODO: LINKS VIA GESTURE DETECTORS?
//TODO: ADD ABILITY TO BOOKMARK POSTS
//TODO: ADD SORTING
//TODO: EDIT DIRECTORIES STRUCTURE!!!
//TODO: MAKE A REAL MIDDLEWARE (via Thunk)
//TODO: ADD REDUX-PERSIST / SHARED-PREFERENCES

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GO HERE FOURTH
    // final _initialState = AppState();
    final Store<AppState> store = Store<AppState>(mainReducer,
        middleware: [thunkMiddleware],
        initialState: AppState(allNewsState: AllNewsState.initial()));

    // final DevToolsStore<AppState> store = DevToolsStore<AppState>(mainReducer,
    //     middleware: [thunkMiddleware],
    //     // initialState: _initialState);
    //     initialState: AppState(allNewsState: AllNewsState.initial()));

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(title: 'Flutter News App'),
          // '/bookmarks': (BuildContext context) => BookmarksPage(title: 'test'),
        },
        title: 'Simple News App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          accentColor: Colors.purpleAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  final devStore;

  HomePage({Key key, this.title, this.devStore}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  void handleBottomNavTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentPage;
    if (_currentPageIndex == 0) {
      currentPage = 'home';
    } else if (_currentPageIndex == 1) {
      currentPage = 'bookmarks';
    }

    String title;
    if (currentPage == 'home') {
      title = widget.title;
    } else if (currentPage == 'bookmarks') {
      title = 'Bookmarks';
    }

    Widget body;
    if (currentPage == 'home') {
      body = Center(child: NewsTileList());
    } else if (currentPage == 'bookmarks') {
      body = Center(child: Text('bookmarks'));
    }
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) => Scaffold(
        appBar: GradientAppBar(
          title: Text(title),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ]),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
            child: body),
        // child: NewsTileList()),
        bottomNavigationBar: GradientBottomNavigationBar(
          backgroundColorStart: Theme.of(context).accentColor,
          backgroundColorEnd: Theme.of(context).primaryColor,
          onTap: handleBottomNavTap,
          currentIndex: _currentPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark),
                title: Text('Bookmarks')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          // child: Icon(Icons.refresh)
          child: store.state.allNewsState.allNewsList.length == 0
              ? Icon(Icons.get_app)
              : Icon(Icons.refresh),
          onPressed: () {
            store.dispatch(fetchAllNewsAction(store));
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButtonLocation:
            store.state.allNewsState.allNewsList.length == 0
                ? FloatingActionButtonLocation.startFloat
                : FloatingActionButtonLocation.startDocked,
      ),
    );
    // );
  }
}
