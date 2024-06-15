import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileResponseModel {
  final AsyncValue<int> statusCode;
  final String? nickname;
  final String? profileImage;
  final int? level;
  final int? totalWakatime;

  ProfileResponseModel({
    required this.statusCode,
    required this.nickname,
    required this.profileImage,
    required this.level,
    required this.totalWakatime,
  });

  factory ProfileResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return ProfileResponseModel(
      statusCode: AsyncData(statusCode),
      nickname: json["nickname"],
      profileImage: json["profile_image"],
      level: json["level"],
      totalWakatime: json["total_wakatime"],
    );
  }

  ProfileResponseModel copyWith({
    AsyncValue<int>? statusCode,
    String? nickname,
    String? profileImage,
    int? level,
    int? totalWakatime,
  }) {
    return ProfileResponseModel(
      statusCode: statusCode ?? this.statusCode,
      nickname: nickname ?? this.nickname,
      profileImage: profileImage ?? this.profileImage,
      level: level ?? this.level,
      totalWakatime: totalWakatime ?? this.totalWakatime,
    );
  }
}
