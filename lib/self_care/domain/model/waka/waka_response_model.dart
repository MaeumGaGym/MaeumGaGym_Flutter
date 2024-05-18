import 'package:flutter_riverpod/flutter_riverpod.dart';

class WakaResponseModel {
  final AsyncValue<int> statusCode;
  final int? totalSeconds;

  WakaResponseModel({
    required this.statusCode,
    required this.totalSeconds,
  });

  factory WakaResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return WakaResponseModel(
      statusCode: AsyncData(statusCode),
      totalSeconds: json["total_seconds"],
    );
  }

  WakaResponseModel copyWith({
    AsyncValue<int>? statusCode,
    int? totalSeconds,
  }) {
    return WakaResponseModel(
      statusCode: statusCode ?? this.statusCode,
      totalSeconds: totalSeconds ?? this.totalSeconds,
    );
  }
}
