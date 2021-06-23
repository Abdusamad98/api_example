import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  String apiUrl;
  String id;
  bool isHosted;
  String pillarId;
  String pillarName;
  String sectionId;
  String sectionName;
  String type;
  String webPublicationDate;
  String webTitle;
  String webUrl;

  Result(
      {required this.apiUrl,
      required this.id,
      required this.isHosted,
      required this.pillarId,
      required this.pillarName,
      required this.sectionId,
      required this.sectionName,
      required this.type,
      required this.webPublicationDate,
      required this.webTitle,
      required this.webUrl});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
