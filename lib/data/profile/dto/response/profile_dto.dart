import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';

class ProfileDto {
  final String nickName;
  final String? profileImage;
  final int level;
  final int totalWakatime;

  const ProfileDto({
    required this.nickName,
    required this.profileImage,
    required this.level,
    required this.totalWakatime,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
      nickName: json["nickname"],
      profileImage: json["profile_image"],
      level: json["level"],
      totalWakatime: json["total_wakatime"],
    );
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      nickName: nickName,
      profileImage: profileImage,
      level: level,
      totalWakatime: totalWakatime,
    );
  }
}