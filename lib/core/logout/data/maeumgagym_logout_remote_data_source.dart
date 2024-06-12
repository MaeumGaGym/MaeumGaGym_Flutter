import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

class MaeumgagymLogoutRemoteDataSource {
  Future<SocialLoginModel> googleLogout() async {
    try {
      await GoogleSignIn().signOut();
      await TokenSecureStorageDi.writeLoginAccessToken(null);
      await TokenSecureStorageDi.writeLoginRefreshToken(null);
      return SocialLoginModel.fromJson(const AsyncData(false), null);
    } catch (err) {
      return SocialLoginModel.fromJson(AsyncError(err, StackTrace.empty), null);
    }
  }

  Future<SocialLoginModel> kakaoLogout() async {
    try {
      await UserApi.instance.logout();
      await TokenSecureStorageDi.writeLoginAccessToken(null);
      await TokenSecureStorageDi.writeLoginRefreshToken(null);
      return SocialLoginModel.fromJson(const AsyncData(false), null);
    } catch (err) {
      return SocialLoginModel.fromJson(AsyncError(err, StackTrace.empty), null);
    }
  }
}
