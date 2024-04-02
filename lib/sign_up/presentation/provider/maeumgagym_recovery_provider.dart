import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_recovery_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_recovery_usecase.dart';

final maeumgagymRecoveryController = StateNotifierProvider<
    MaeumgagymRecoveryStateNotifier, MaeumgagymRecoveryState>((ref) {
  return MaeumgagymRecoveryStateNotifier();
});

class MaeumgagymRecoveryStateNotifier
    extends StateNotifier<MaeumgagymRecoveryState> {
  MaeumgagymRecoveryStateNotifier()
      : super(MaeumgagymRecoveryState(
          googleAsyncValue: const AsyncData(500),
          kakaoAsyncValue: const AsyncData(500),
        ));

  final MaeumgagymRecoveryUseCase _useCase =
      MaeumgagymRecoveryUseCase(MaeumgagymRecoveryRepositoryImpl());

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
    state = state.copyWith(googleAsyncValue: const AsyncLoading());
    AsyncValue<int> status = await _useCase.googleRecovery(googleToken);
    state = state.copyWith(googleAsyncValue: status);
  }

  Future<void> kakaoRecovery(String kakaoToken) async {
    state = state.copyWith(kakaoAsyncValue: const AsyncLoading());
    AsyncValue<int> status = await _useCase.kakaoRecovery(kakaoToken);
    state = state.copyWith(kakaoAsyncValue: status);
  }
}

class MaeumgagymRecoveryState {
  AsyncValue<int> googleAsyncValue;
  AsyncValue<int> kakaoAsyncValue;

  MaeumgagymRecoveryState({
    required this.googleAsyncValue,
    required this.kakaoAsyncValue,
  });

  MaeumgagymRecoveryState copyWith(
          {AsyncValue<int>? googleAsyncValue,
          AsyncValue<int>? kakaoAsyncValue}) =>
      MaeumgagymRecoveryState(
        googleAsyncValue: googleAsyncValue ?? this.googleAsyncValue,
        kakaoAsyncValue: kakaoAsyncValue ?? this.kakaoAsyncValue,
      );
}
