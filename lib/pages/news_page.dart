import 'package:api_example/bloc/news_bloc.dart';
import 'package:api_example/bloc/news_bloc_events.dart';
import 'package:api_example/bloc/news_bloc_states.dart';
import 'package:api_example/widgets/card.dart';
import 'package:api_example/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = 'newsRoute';

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var isDelete = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsListingBloc>(context).add(InitialNewsEvent());

    Future<void> _refresh() async {
      setState(() {
        isDelete = true;
      });
      BlocProvider.of<NewsListingBloc>(context).add(InitialNewsEvent());
    }

    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Global News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SearchBar(
              isDelete: isDelete,
            ),
            SizedBox(
              height: 20.0,
            ),
            BlocBuilder<NewsListingBloc, NewsListingState>(
              builder: (context, state) {
                if (state is NewsFetchingState) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is NewsFetchedState) {
                  var results = state.news.response.results;
                  print(state.news.response.results[0].webTitle);
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: Container(
                          child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: List.generate(
                            results.length,
                            (index) => GestureDetector(
                              onTap: () {},
                              child: NewsCard(
                                result: results[index],
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  );
                } else if (state is NewsEmptyState) {
                  return Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.hourglass_empty,
                            color: Colors.red,
                          ),
                          iconSize: 100,
                          onPressed: null,
                        ),
                        Text(
                          'Empty...',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        )
                      ],
                    ),
                  );
                } else if (state is NewsEmptyState) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.wifi_off,
                              color: Colors.red,
                            ),
                            iconSize: 100,
                            onPressed: null,
                          ),
                          Text(
                            'Error! ',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                } else
                  return SizedBox();
              },
            ),
            //PlayerListing(),
          ],
        ),
      ),
    );
  }
}
