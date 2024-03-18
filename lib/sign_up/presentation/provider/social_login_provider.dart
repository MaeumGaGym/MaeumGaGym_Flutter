import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/login_option_di.dart';
import '../../data/repositoryImpl/google_login_repository_impl.dart';
import '../../data/repositoryImpl/kakao_login_repository_impl.dart';
import '../../domain/model/social_login_model.dart';
import '../../domain/usecase/social_login_usecase.dart';

final socialLoginController =
    StateNotifierProvider<SocialLoginStateNotifier, SocialLoginState>((ref) {
  return SocialLoginStateNotifier();
});

class SocialLoginStateNotifier extends StateNotifier<SocialLoginState> {
  SocialLoginStateNotifier()
      : super(SocialLoginState(
          googleAsyncValue: const AsyncData(false),
          kakaoAsyncValue: const AsyncData(false),
          token: null,
        ));

  late SocialLoginUseCase _useCase;

  Future<void> setLoginOption(LoginOption option) async {
    switch (option) {
      case LoginOption.google:
        _useCase = SocialLoginUseCase(GoogleLoginRepositoryImpl());
        break;
      case LoginOption.kakao:
        _useCase = SocialLoginUseCase(KaKaoLoginRepositoryImpl());
        break;
      case LoginOption.all:
        break;
    }
  }

  Future<void> login(LoginOption option) async {
    switch (option) {
      case LoginOption.google:
        state = state.copyWith(googleAsyncValue: const AsyncLoading());
        SocialLoginModel loginState = await _useCase.login();
        state = state.copyWith(
          googleAsyncValue: loginState.stateus,
          token: loginState.token,
        );
        break;
      case LoginOption.kakao:
        state = state.copyWith(kakaoAsyncValue: const AsyncLoading());
        SocialLoginModel loginState = await _useCase.login();
        state = state.copyWith(
          kakaoAsyncValue: loginState.stateus,
          token: loginState.token,
        );
        break;
      case LoginOption.all:
        throw Exception('socialLogin LoginOption is All');
    }
  }

  Future<void> logout() async {
    SocialLoginModel loginState = await _useCase.logout();

    SocialLoginState(
      googleAsyncValue: loginState.stateus,
      kakaoAsyncValue: loginState.stateus,
      token: loginState.token,
    );
  }
}

class SocialLoginState {
  final AsyncValue<bool> googleAsyncValue;
  final AsyncValue<bool> kakaoAsyncValue;
  final String? token;

  SocialLoginState({
    required this.googleAsyncValue,
    required this.kakaoAsyncValue,
    required this.token,
  });

  SocialLoginState copyWith(
      {AsyncValue<bool>? googleAsyncValue,
      AsyncValue<bool>? kakaoAsyncValue,
      String? token}) {
    return SocialLoginState(
      googleAsyncValue: googleAsyncValue ?? this.googleAsyncValue,
      kakaoAsyncValue: kakaoAsyncValue ?? this.kakaoAsyncValue,
      token: token ?? this.token,
    );
  }
}
