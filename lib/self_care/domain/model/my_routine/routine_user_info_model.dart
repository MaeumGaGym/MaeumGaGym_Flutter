class RoutineUserInfoModel {
  final String? nickname;
  final String? profileImage;

  RoutineUserInfoModel({
    required this.nickname,
    required this.profileImage,
  });

  factory RoutineUserInfoModel.fromJson(Map<String, dynamic> json) {
    return RoutineUserInfoModel(
      nickname: json['nickname'],
      profileImage: json['profile_image'],
    );
  }
}
