import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurposeResponseModel {
  final AsyncValue<int> statusCode;
  final String? title;
  final String? content;
  final String? startDate;
  final String? endDate;

  PurposeResponseModel({
    required this.statusCode,
    required this.title,
    required this.content,
    required this.startDate,
    required this.endDate,
  });

  factory PurposeResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return PurposeResponseModel(
      statusCode: AsyncData(statusCode),
      title: json['title'],
      content: json['content'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}
