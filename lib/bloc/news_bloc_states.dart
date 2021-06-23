import 'package:api_example/models/news_api_result.dart';

abstract class NewsListingState {}

class NewsUninitializedState extends NewsListingState {}

class NewsFetchingState extends NewsListingState {}

class NewsFetchedState extends NewsListingState {
  final NewsApiResult news;
  NewsFetchedState({required this.news});
}

class NewsErrorState extends NewsListingState {}

class NewsEmptyState extends NewsListingState {}
