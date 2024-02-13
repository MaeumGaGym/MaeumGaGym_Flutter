import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KaKaoLoginRemoteDataSource {
  late String _token;

  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          final oauthToken = await UserApi.instance.loginWithKakaoTalk();
          _token = oauthToken.accessToken;
          return true;
        } catch (err) {
          return false;
        }
      } else {
        try {
          final oauthToken = await UserApi.instance.loginWithKakaoTalk();
          _token = oauthToken.accessToken;
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
      _token = '';
      return false;
    } catch (err) {
      return true;
    }
  }

  Future<String> getToken() async {
    try {
      return _token;
    } catch (err) {
      return err.toString();
    }
  }
}
