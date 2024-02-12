import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KaKaoLoginRemoteDataSource {
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (err) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (err) {
          return false;
        }
      }
    } catch (err) {
      return false;
    }
  }


  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<String> getToken() async {
    String token = '';

    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          final oauthToken = await UserApi.instance.loginWithKakaoTalk();
          token = oauthToken.accessToken;
          return token;
        } catch (err) {
          return '';
        }
      } else {
        try {
          final kakaoToken = await UserApi.instance.loginWithKakaoAccount();
          return kakaoToken.accessToken.toString();
        } catch (err) {
          return '';
        }
      }
    } catch (err) {
      return '';
    }
  }
}
