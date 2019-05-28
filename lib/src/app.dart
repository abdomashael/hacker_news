import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_details.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: "Hacker news",
        theme: ThemeData(
          primaryColor: Colors.yellow,
          accentColor: Colors.yellowAccent,
        ),
        home: NewsList(),
        routes: {
          NewsDetails.routeName : (context) => NewsDetails(),
        },
      ),
    );
  }
}
