import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/data/repositoryImpl/google_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/data/repositoryImpl/kakao_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/domain/usecase/social_login_usecase.dart';

enum LoginOption { google, kakao, apple }

final socialLoginController =
    StateNotifierProvider<SocialLoginStateNotifier, SocialLoginState>((ref) {
  return SocialLoginStateNotifier();
});

class SocialLoginStateNotifier extends StateNotifier<SocialLoginState> {
  SocialLoginStateNotifier()
      : super(SocialLoginState(isLogined: false, token: ''));

  late SocialLoginUseCase _useCase;

  Future<void> setLoginOption(LoginOption option) async {
    switch (option) {
      case LoginOption.google:
        _useCase = SocialLoginUseCase(GoogleLoginRepositoryImpl());
      case LoginOption.kakao:
        _useCase = SocialLoginUseCase(KaKaoLoginRepositoryImpl());
      case LoginOption.apple:
        _useCase = SocialLoginUseCase(GoogleLoginRepositoryImpl());
    }
  }

  Future<void> login() async {
    bool loginState = await _useCase.login();

    if (loginState) {
      String token = await _useCase.getToken();

      state = SocialLoginState(isLogined: loginState, token: token);
    } else {
      state = SocialLoginState(isLogined: loginState, token: '');
    }
  }

  Future<void> logout() async {
    bool loginState = await _useCase.logout();

    state = SocialLoginState(isLogined: loginState, token: '');
  }
}

class SocialLoginState {
  bool isLogined;
  String token;

  SocialLoginState({
    required this.isLogined,
    required this.token,
  });
}
