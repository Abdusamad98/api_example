// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'my_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    apiUrl: json['apiUrl'] as String,
    id: json['id'] as String,
    isHosted: json['isHosted'] as bool,
    pillarId: json['pillarId'] as String,
    pillarName: json['pillarName'] as String,
    sectionId: json['sectionId'] as String,
    sectionName: json['sectionName'] as String,
    type: json['type'] as String,
    webPublicationDate: json['webPublicationDate'] as String,
    webTitle: json['webTitle'] as String,
    webUrl: json['webUrl'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'id': instance.id,
      'isHosted': instance.isHosted,
      'pillarId': instance.pillarId,
      'pillarName': instance.pillarName,
      'sectionId': instance.sectionId,
      'sectionName': instance.sectionName,
      'type': instance.type,
      'webPublicationDate': instance.webPublicationDate,
      'webTitle': instance.webTitle,
      'webUrl': instance.webUrl,
    };
