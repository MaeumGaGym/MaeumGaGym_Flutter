import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../../core/model/social_login_model.dart';

class KaKaoLoginRemoteDataSource {
  String? _token;

  Future<SocialLoginModel> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          final OAuthToken oauthToken = await UserApi.instance.loginWithKakaoTalk();
          _token = oauthToken.accessToken;
          return SocialLoginModel.fromJson(const AsyncData(true), _token);
        } catch (err) {
          return SocialLoginModel.fromJson(
            AsyncError(err, StackTrace.empty),
            null,
          );
          // return SocialLoginModel.fromJson(const AsyncData(false), _token);
        }
      } else {
        try {
          final OAuthToken oauthToken = await UserApi.instance.loginWithKakaoAccount();
          // final oauthToken = await UserApi.instance.loginWithKakaoTalk();
          _token = oauthToken.accessToken;
          return SocialLoginModel.fromJson(const AsyncData(true), _token);
        } catch (err) {
          return SocialLoginModel.fromJson(
            AsyncError(err, StackTrace.empty),
            null,
          );
          // return SocialLoginModel.fromJson(const AsyncData(false), _token);
        }
      }
    } catch (err) {
      return SocialLoginModel.fromJson(AsyncError(err, StackTrace.empty), null);
    }
  }
}
