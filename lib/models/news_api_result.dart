import 'package:json_annotation/json_annotation.dart';
import 'response.dart';
part 'news_api_result.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsApiResult {
  Response response;

  NewsApiResult({required this.response});

  factory NewsApiResult.fromJson(Map<String, dynamic> json) =>
      _$NewsApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$NewsApiResultToJson(this);
}
