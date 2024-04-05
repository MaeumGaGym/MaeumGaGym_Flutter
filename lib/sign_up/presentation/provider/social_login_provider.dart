import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/login_option_di.dart';
import '../../data/repositoryImpl/google_login_repository_impl.dart';
import '../../data/repositoryImpl/kakao_login_repository_impl.dart';
import '../../domain/model/social_login_model.dart';
import '../../domain/usecase/social_login_usecase.dart';

final socialLoginController =
    StateNotifierProvider<SocialLoginStateNotifier, SocialLoginModel>((ref) {
  return SocialLoginStateNotifier();
});

class SocialLoginStateNotifier extends StateNotifier<SocialLoginModel> {
  SocialLoginStateNotifier()
      : super(SocialLoginModel(
          stateus: const AsyncData(false),
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
        state = state.copyWith(status: const AsyncLoading());
        SocialLoginModel loginState = await _useCase.login();
        state = state.copyWith(
          status: loginState.stateus,
          token: loginState.token,
        );
        break;
      case LoginOption.kakao:
        state = state.copyWith(status: const AsyncLoading());
        SocialLoginModel loginState = await _useCase.login();
        state = state.copyWith(
          status: loginState.stateus,
          token: loginState.token,
        );
        break;
      case LoginOption.all:
        throw Exception('socialLogin LoginOption is All');
    }
  }

  Future<void> logout() async {
    SocialLoginModel loginState = await _useCase.logout();

    SocialLoginModel(
      stateus: loginState.stateus,
      token: loginState.token,
    );
  }
}
