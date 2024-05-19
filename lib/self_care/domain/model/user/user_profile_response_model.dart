import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileResponseModel {
  final AsyncValue<int> statusCode;
  final String? nickname;
  final String? profileImage;
  final int? level;
  final int? totalWakatime;

  UserProfileResponseModel({
    required this.statusCode,
    required this.nickname,
    required this.profileImage,
    required this.level,
    required this.totalWakatime,
  });

  factory UserProfileResponseModel.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return UserProfileResponseModel(
      statusCode: AsyncData(statusCode),
      nickname: json["nickname"],
      profileImage: json["profile_image"],
      level: json["level"],
      totalWakatime: json["total_wakatime"],
    );
  }

  UserProfileResponseModel copyWith({
    AsyncValue<int>? statusCode,
    String? nickname,
    String? profileImage,
    int? level,
    int? totalWakatime,
  }) {
    return UserProfileResponseModel(
      statusCode: statusCode ?? this.statusCode,
      nickname: nickname ?? this.nickname,
      profileImage: profileImage ?? this.profileImage,
      level: level ?? this.level,
      totalWakatime: totalWakatime ?? this.totalWakatime,
    );
  }
}
