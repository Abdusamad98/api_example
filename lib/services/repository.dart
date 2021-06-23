import 'package:api_example/services/news_api_provider.dart';
import 'package:api_example/models/news_api_result.dart';

class NewsRepository {
  NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<NewsApiResult> fetchNewsByQuery(String query) =>
      _newsApiProvider.fetchNewsByQuery(query);
}
