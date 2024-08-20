class ProfileEntity {
  final String nickName;
  final String? profileImage;
  final int level;
  final int totalWakatime;

  const ProfileEntity({
    required this.nickName,
    required this.profileImage,
    required this.level,
    required this.totalWakatime,
  });
}