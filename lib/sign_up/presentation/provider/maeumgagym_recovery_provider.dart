import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_recovery_usecase.dart';

final maeumgagymRecoveryController =
    StateNotifierProvider<MaeumgagymRecoveryStateNotifier, AsyncValue<int>>(
        (ref) {
  return MaeumgagymRecoveryStateNotifier();
});

class MaeumgagymRecoveryStateNotifier extends StateNotifier<AsyncValue<int>> {
  MaeumgagymRecoveryStateNotifier() : super(const AsyncData(500));

  final MaeumgagymRecoveryUseCase _useCase = MaeumgagymRecoveryUseCase();

  Future<void> switchRecovery(
      LoginOption loginOption, String oauthToken) async {
    switch (loginOption) {
      case LoginOption.google:
        debugPrint("recovery GoogleToken : $oauthToken");
        await googleRecovery(oauthToken);
        break;
      case LoginOption.kakao:
        debugPrint("recovery KaKaoToken : $oauthToken");
        await kakaoRecovery(oauthToken);
        break;
      case LoginOption.all:
        break;
    }
  }

  Future<void> googleRecovery(String googleToken) async {
    state = const AsyncLoading();
    AsyncValue<int> status = await _useCase.googleRecovery(googleToken);
    state = status;
  }

  Future<void> kakaoRecovery(String kakaoToken) async {
    state = const AsyncLoading();
    AsyncValue<int> status = await _useCase.kakaoRecovery(kakaoToken);
    state = status;
  }
}
