import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

class MaeumgagymLogoutRemoteDataSource {
  Future<SocialLoginModel> logout() async {
    try {
      /// 구글 로그아웃
      await GoogleSignIn().signOut();
      /// 카카오 로그아웃
      await UserApi.instance.unlink();
      return SocialLoginModel.fromJson(const AsyncData(false), null);
    } catch (err) {
      return SocialLoginModel.fromJson(AsyncError(err, StackTrace.empty), null);
    }
  }
}