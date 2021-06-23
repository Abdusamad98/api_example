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
    print('Si');
    try {
      if (event is InitialNewsEvent) {
        print('Si0');
        news = await newsRepository!.fetchNewsByQuery('');
        print('Si1');
      } else if (event is SearchTextChangedEvent) {
        news = await newsRepository!.fetchNewsByQuery(event.searchTerm);
        print('Si2');
      }
      if (news.response.results.isEmpty) {
        yield NewsEmptyState();
        print('Si3');
      } else {
        yield NewsFetchedState(news: news);
        print('Si4');
      }
    } catch (error) {
      print(error);
      print('Si5');
      yield NewsErrorState();
    }
  }
}
