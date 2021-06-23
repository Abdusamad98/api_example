import 'package:api_example/constants/constants.dart';
import 'package:api_example/models/news_api_result.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NewsApiProvider {
  var dio = Dio();

  Future<NewsApiResult> fetchNewsByQuery(String query) async {
    var stringUrl = BASE_URL + 'search?q=' + query + '&api-key=' + API_KEY;
    final Response response = await dio.get(stringUrl);
    return parseResponse(response);
  }

  NewsApiResult parseResponse(Response response) {
    print(response.statusCode);
    if (response.statusCode == SUCCESS_CODE) {
      print(response.data);
      return NewsApiResult.fromJson(response.data);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
