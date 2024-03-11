import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositoryImpl/google_login_repository_impl.dart';
import '../../data/repositoryImpl/kakao_login_repository_impl.dart';
import '../../domain/usecase/social_login_usecase.dart';

enum LoginOption { google, kakao }

final socialLoginController =
    StateNotifierProvider<SocialLoginStateNotifier, SocialLoginState>((ref) {
  return SocialLoginStateNotifier();
});

class SocialLoginStateNotifier extends StateNotifier<SocialLoginState> {
  SocialLoginStateNotifier()
      : super(SocialLoginState(isGoogle: true, isLogined: false, token: ''));

  late SocialLoginUseCase _useCase;

  Future<void> setLoginOption(LoginOption option) async {
    switch (option) {
      case LoginOption.google:
        state = SocialLoginState(
            isGoogle: true, isLogined: state.isLogined, token: state.token);
        _useCase = SocialLoginUseCase(GoogleLoginRepositoryImpl());
        break;
      case LoginOption.kakao:
        state = SocialLoginState(
            isGoogle: false, isLogined: state.isLogined, token: state.token);
        _useCase = SocialLoginUseCase(KaKaoLoginRepositoryImpl());
        break;
    }
  }

  Future<void> login() async {
    bool loginState = await _useCase.login();

    if (loginState) {
      String tokenValue = await _useCase.getToken();

      state = SocialLoginState(
          isGoogle: state.isGoogle, isLogined: loginState, token: tokenValue);
    } else {
      state = SocialLoginState(
          isGoogle: state.isGoogle, isLogined: loginState, token: '');
    }
  }

  Future<void> logout() async {
    bool loginState = await _useCase.logout();

    SocialLoginState(
        isGoogle: state.isGoogle, isLogined: loginState, token: '');
  }
}

class SocialLoginState {
  final bool isLogined;
  final bool isGoogle;
  final String token;

  SocialLoginState({
    required this.isLogined,
    required this.isGoogle,
    required this.token,
  });
}
