import 'package:json_annotation/json_annotation.dart';

import 'my_result.dart';
part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  int currentPage;
  String orderBy;
  int pageSize;
  int pages;
  List<Result> results;
  int startIndex;
  String status;
  int total;
  String userTier;

  Response(
      {required this.currentPage,
      required this.orderBy,
      required this.pageSize,
      required this.pages,
      required this.results,
      required this.startIndex,
      required this.status,
      required this.total,
      required this.userTier});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
