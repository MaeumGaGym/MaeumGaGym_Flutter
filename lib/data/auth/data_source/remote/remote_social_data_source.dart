import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../../domain/auth/entity/social_entity.dart';
import '../../../../core/enum/social_state_enum.dart';
import '../../dto/response/social_dto.dart';

class RemoteSocialDataSource {
  late String? _token;

  /// Social Login
  Future<SocialEntity> socialLogin({required SocialStateEnum socialLoginRequest}) {
    switch (socialLoginRequest) {
      case SocialStateEnum.google:
        return _googleLogin();
      case SocialStateEnum.kakao:
        return _kakaoLogin();
    }
  }

  /// Social Logout
  Future<void> socialLogout({required SocialStateEnum socialLoginRequest}) {
    switch (socialLoginRequest) {
      case SocialStateEnum.google:
        return _googleLogout();
      case SocialStateEnum.kakao:
        return _kakaoLogout();
    }
  }

  Future<SocialEntity> _googleLogin() async {
    try {
      // google login 관련 로직
      GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      _token = googleAuth?.accessToken;

      if (_token != null) {
        return SocialDto(token: _token!).toEntity();
      } else {
        throw Exception("Google Login : Token is Null");
      }
    } catch (err) {
      // 오류가 날 경우
      throw Exception("Google Login : $err");
    }
  }

  Future<SocialEntity> _kakaoLogin() async {
    try {
      // kakao login 관련 로직
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        final OAuthToken oauthToken = await UserApi.instance.loginWithKakaoTalk();
        _token = oauthToken.accessToken;
        return SocialDto(token: _token!).toEntity();
      } else {
        final OAuthToken oauthToken = await UserApi.instance.loginWithKakaoAccount();
        _token = oauthToken.accessToken;
        return SocialDto(token: _token!).toEntity();
      }
    } catch (err) {
      // 오류가 날 경우
      throw Exception("KaKao Login : $err");
    }
  }

  Future<void> _googleLogout() async {
    await GoogleSignIn().signOut();
  }

  Future<void> _kakaoLogout() async {
    await UserApi.instance.logout();
  }
}
