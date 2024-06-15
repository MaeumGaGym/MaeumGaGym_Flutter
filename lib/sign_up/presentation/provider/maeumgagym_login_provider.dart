import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_login_usecase.dart';

import '../../domain/model/maeumgagym_login_model.dart';

final maeumgagymLoginController =
    StateNotifierProvider<MaeumgagymLoginStateNotifier, MaeumgagymLoginModel>(
        (ref) {
  return MaeumgagymLoginStateNotifier();
});

class MaeumgagymLoginStateNotifier extends StateNotifier<MaeumgagymLoginModel> {
  MaeumgagymLoginStateNotifier()
      : super(MaeumgagymLoginModel(
          statusCode: const AsyncData(500),
          accessToken: null,
          refreshToken: null,
        ));

  final MaeumgagymLoginUseCase _useCase = MaeumgagymLoginUseCase();

  Future<void> googleLogin(String googleToken) async {
    state = state.copyWith(statusCode: const AsyncLoading());
    MaeumgagymLoginModel googleLoginToken =
        await _useCase.googleLogin(googleToken);

    await TokenSecureStorageDi.writeLoginAccessToken(
        googleLoginToken.accessToken);
    await TokenSecureStorageDi.writeLoginRefreshToken(
        googleLoginToken.refreshToken);

    state = state.copyWith(statusCode: googleLoginToken.statusCode);
  }

  Future<void> kakaoLogin(String kakaoToken) async {
    state = state.copyWith(statusCode: const AsyncLoading());
    MaeumgagymLoginModel kakaoLoginToken =
        await _useCase.kakaoLogin(kakaoToken);

    await TokenSecureStorageDi.writeLoginAccessToken(
        kakaoLoginToken.accessToken);
    await TokenSecureStorageDi.writeLoginRefreshToken(
        kakaoLoginToken.refreshToken);

    state = state.copyWith(statusCode: kakaoLoginToken.statusCode);
  }
}
