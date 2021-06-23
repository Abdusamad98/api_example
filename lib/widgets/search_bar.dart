import 'package:api_example/bloc/news_bloc.dart';
import 'package:api_example/bloc/news_bloc_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  final bool isDelete;

  TextEditingController controller = TextEditingController();

  SearchBar({required this.isDelete});

  @override
  Widget build(BuildContext context) {
    if (isDelete) controller.clear();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        onChanged: (term) {
          print(term);
          BlocProvider.of<NewsListingBloc>(context)
              .add(SearchTextChangedEvent(searchTerm: term));
        },
        //style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
