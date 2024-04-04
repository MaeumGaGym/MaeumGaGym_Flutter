import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialLoginModel {
  AsyncValue<bool> stateus;
  String? token;

  SocialLoginModel({required this.stateus, required this.token});

  factory SocialLoginModel.fromJson(AsyncValue<bool> stateus, String? token) {
    return SocialLoginModel(
      stateus: stateus,
      token: token,
    );
  }

  SocialLoginModel copyWith({AsyncValue<bool>? status, String? token}) {
    return SocialLoginModel(
      stateus: stateus,
      token: token ?? this.token,
    );
  }
}
