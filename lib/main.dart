import 'package:api_example/bloc/news_bloc.dart';
import 'package:api_example/pages/news_page.dart';
import 'package:api_example/pages/web_page.dart';
import 'package:api_example/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  NewsRepository newsRepository = NewsRepository();

  runApp(MyApp(
    newsRepository: newsRepository,
  ));
}

class MyApp extends StatelessWidget {
  final NewsRepository? newsRepository;
  MyApp({this.newsRepository});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NewsListingBloc(newsRepository: newsRepository),
      child: MaterialApp(
        title: 'Flutter Api Example',
        theme: ThemeData(
          fontFamily: "GoogleSans",
          primarySwatch: Colors.blue,
        ),
        home: NewsPage(),
        // routes: {
        //   NewsPage.routeName: (ctx) => NewsPage(),
        //   MyWebPage.routeName: (ctx) => MyWebPage(
        //         url: '',
        //       ),
        // },
      ),
    );
  }
}
