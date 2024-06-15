import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurposeResponseModel {
  final AsyncValue<int> statusCode;
  final int? id;
  final String? title;
  final String? content;
  final String? startDate;
  final String? endDate;

  PurposeResponseModel({
    required this.statusCode,
    required this.id,
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
      id: json['id'],
      title: json['title'],
      content: json['content'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  PurposeResponseModel copyWith({
    AsyncValue<int>? statusCode,
    int? id,
    String? title,
    String? content,
    String? startDate,
    String? endDate,
  }) {
    return PurposeResponseModel(
      statusCode: statusCode ?? this.statusCode,
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
