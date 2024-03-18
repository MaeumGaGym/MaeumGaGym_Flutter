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
      : super(MaeumgagymLoginState(
          googleAsyncValue: const AsyncData(500),
          kakaoAsyncValue: const AsyncData(500),
        ));

  final MaeumgagymLoginUseCase _useCase = MaeumgagymLoginUseCase(
    MaeumgagymLoginRepositoryImpl(),
  );

  Future<void> googleLogin(String googleToken) async {
    state = state.copyWith(googleAsyncValue: const AsyncLoading());
    MaeumgagymLoginModel googleLoginToken =
        await _useCase.googleLogin(googleToken);

    await TokenSecureStorageDi.writeGoogleLoginAccessToken(
        googleLoginToken.accessToken);
    await TokenSecureStorageDi.writeGoogleLoginRefreshToken(
        googleLoginToken.refreshToken);

    state = state.copyWith(googleAsyncValue: googleLoginToken.statusCode);
  }

  Future<void> kakaoLogin(String kakaoToken) async {
    state = state.copyWith(kakaoAsyncValue: const AsyncLoading());
    MaeumgagymLoginModel kakaoLoginToken =
        await _useCase.kakaoLogin(kakaoToken);

    await TokenSecureStorageDi.writeKaKaoLoginAccessToken(
        kakaoLoginToken.accessToken);
    await TokenSecureStorageDi.writeKaKaoLoginRefreshToken(
        kakaoLoginToken.refreshToken);

    state = state.copyWith(kakaoAsyncValue: kakaoLoginToken.statusCode);
  }
}

class MaeumgagymLoginState {
  AsyncValue<int> googleAsyncValue;
  AsyncValue<int> kakaoAsyncValue;

  MaeumgagymLoginState({
    required this.googleAsyncValue,
    required this.kakaoAsyncValue,
  });

  MaeumgagymLoginState copyWith({
    AsyncValue<int>? googleAsyncValue,
    AsyncValue<int>? kakaoAsyncValue,
  }) {
    return MaeumgagymLoginState(
      googleAsyncValue: googleAsyncValue ?? this.googleAsyncValue,
      kakaoAsyncValue: kakaoAsyncValue ?? this.kakaoAsyncValue,
    );
  }
}
