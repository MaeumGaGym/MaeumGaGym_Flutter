import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/data/repositoryImpl/google_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/domain/usecase/social_login_usercase.dart';

final googleLoginController =
StateNotifierProvider<GoogleLoginStateNotifier, GoogleLoginState>((ref) {
  return GoogleLoginStateNotifier();
});

class GoogleLoginStateNotifier extends StateNotifier<GoogleLoginState> {
  GoogleLoginStateNotifier()
      : super(GoogleLoginState(isLogined: false, token: ''));

  final SocialLoginUseCase _useCase =
  SocialLoginUseCase(GoogleLoginRepositoryImpl());

  Future<void> login() async {
    bool loginState = await _useCase.login();

    if (loginState) {
      String token = await _useCase.getToken();

      state = GoogleLoginState(isLogined: true, token: token);
    } else {
      state = GoogleLoginState(isLogined: false, token: '');
    }
  }

  Future<void> logout() async {
    await _useCase.logout();
    state = GoogleLoginState(isLogined: false, token: '');
  }
}

class GoogleLoginState {
  bool isLogined;
  String token;

  GoogleLoginState({
    required this.isLogined,
    required this.token,
  });
}
