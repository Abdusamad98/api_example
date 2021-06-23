// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    currentPage: json['currentPage'] as int,
    orderBy: json['orderBy'] as String,
    pageSize: json['pageSize'] as int,
    pages: json['pages'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
    startIndex: json['startIndex'] as int,
    status: json['status'] as String,
    total: json['total'] as int,
    userTier: json['userTier'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'orderBy': instance.orderBy,
      'pageSize': instance.pageSize,
      'pages': instance.pages,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'startIndex': instance.startIndex,
      'status': instance.status,
      'total': instance.total,
      'userTier': instance.userTier,
    };
