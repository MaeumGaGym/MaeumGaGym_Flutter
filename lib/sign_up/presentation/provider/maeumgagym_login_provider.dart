import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_login_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_login_usecase.dart';

import '../../domain/model/maeumgagym_login_model.dart';

final maeumgagymLoginController =
    StateNotifierProvider<MaeumgagymLoginStateNotifier, MaeumgagymLoginState>(
        (ref) {
  return MaeumgagymLoginStateNotifier();
});

class MaeumgagymLoginStateNotifier extends StateNotifier<MaeumgagymLoginState> {
  MaeumgagymLoginStateNotifier()
      : super(MaeumgagymLoginState(stateusCode: 404));

  final MaeumgagymLoginUseCase _useCase =
      MaeumgagymLoginUseCase(MaeumgagymLoginRepositoryImpl());

  Future<void> googleLogin(String googleToken) async {
    MaeumgagymLoginModel googleLoginToken =
        await _useCase.googleLogin(googleToken);
    await TokenSecureStorageDi.writeAccessToken(googleLoginToken.accessToken);
    await TokenSecureStorageDi.writeRefreshToken(googleLoginToken.refreshToken);

    state = MaeumgagymLoginState(stateusCode: googleLoginToken.statusCode);
  }

  Future<void> kakaoLogin(String kakaoToken) async {
    MaeumgagymLoginModel kakaoLoginToken =
        await _useCase.kakaoLogin(kakaoToken);
    await TokenSecureStorageDi.writeAccessToken(kakaoLoginToken.accessToken);
    await TokenSecureStorageDi.writeRefreshToken(kakaoLoginToken.refreshToken);

    state = MaeumgagymLoginState(stateusCode: kakaoLoginToken.statusCode);
  }
}

class MaeumgagymLoginState {
  final int stateusCode;

  MaeumgagymLoginState({required this.stateusCode});
}
