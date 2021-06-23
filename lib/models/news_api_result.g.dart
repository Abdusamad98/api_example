// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsApiResult _$NewsApiResultFromJson(Map<String, dynamic> json) {
  return NewsApiResult(
    response: Response.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsApiResultToJson(NewsApiResult instance) =>
    <String, dynamic>{
      'response': instance.response.toJson(),
    };
