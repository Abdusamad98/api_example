import 'package:api_example/models/news_api_result.dart';
import 'package:api_example/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_bloc_events.dart';
import 'news_bloc_states.dart';

class NewsListingBloc extends Bloc<NewsListingEvent, NewsListingState> {
  final NewsRepository? newsRepository;

  NewsListingBloc({this.newsRepository}) : super(NewsFetchingState());

  //NewsListingState get initialState => ;

  @override
  Stream<NewsListingState> mapEventToState(NewsListingEvent event) async* {
    yield NewsFetchingState();
    late NewsApiResult news;

    try {
      if (event is InitialNewsEvent) {
        news = await newsRepository!.fetchNewsByQuery('');
      } else if (event is SearchTextChangedEvent) {
        yield NewsFetchingState();
        news = await newsRepository!.fetchNewsByQuery(event.searchTerm);
      }
      if (news.response.results.isEmpty) {
        yield NewsEmptyState();
      } else {
        yield NewsFetchedState(news: news);
      }
    } catch (error) {
      yield NewsErrorState();
    }
  }
}
