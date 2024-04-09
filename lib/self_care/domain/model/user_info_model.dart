class UserInfoModel {
  final String? nickname;
  final String? profileImage;

  UserInfoModel({
    required this.nickname,
    required this.profileImage,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      nickname: json['nickname'],
      profileImage: json['profile_image'],
    );
  }
}
