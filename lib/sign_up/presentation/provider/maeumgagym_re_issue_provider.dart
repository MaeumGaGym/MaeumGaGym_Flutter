import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_re_issue_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_re_issue_usecase.dart';

import '../../../core/di/token_secure_storage_di.dart';

final maeumgagymReIssueController = StateNotifierProvider<
    MaeumgagymReIssueStateNotifier, MaeumgagymReIssueState>((ref) {
  return MaeumgagymReIssueStateNotifier();
});

class MaeumgagymReIssueStateNotifier
    extends StateNotifier<MaeumgagymReIssueState> {
  MaeumgagymReIssueStateNotifier()
      : super(MaeumgagymReIssueState(
          googleAsyncValue: const AsyncData(500),
          kakaoAsyncValue: const AsyncData(500),
        ));

  final MaeumgagymReIssueUseCase _useCase =
      MaeumgagymReIssueUseCase(MaeumgagymReIssueRepositoryImpl());

  Future<void> getReIssue(String refreshToken, LoginOption loginOption) async {
    switch (loginOption) {
      case LoginOption.google:
        state = state.copyWith(googleAsyncValue: const AsyncLoading());
        break;
      case LoginOption.kakao:
        state = state.copyWith(kakaoAsyncValue: const AsyncLoading());
        break;
      case LoginOption.all:
        break;
    }
    MaeumgagymReIssueModel reIssueToken =
        await _useCase.getReIssue(refreshToken);

    switch (loginOption) {
      case LoginOption.google:
        await TokenSecureStorageDi.writeGoogleLoginAccessToken(
            reIssueToken.accessToken);
        await TokenSecureStorageDi.writeGoogleLoginRefreshToken(
            reIssueToken.refreshToken);
        state = state.copyWith(googleAsyncValue: reIssueToken.stateus);
        break;
      case LoginOption.kakao:
        await TokenSecureStorageDi.writeKaKaoLoginAccessToken(
            reIssueToken.accessToken);
        await TokenSecureStorageDi.writeKaKaoLoginRefreshToken(
            reIssueToken.refreshToken);
        state = state.copyWith(kakaoAsyncValue: reIssueToken.stateus);
        break;
      case LoginOption.all:
        break;
    }
  }
}

class MaeumgagymReIssueState {
  AsyncValue<int> googleAsyncValue;
  AsyncValue<int> kakaoAsyncValue;

  MaeumgagymReIssueState({
    required this.googleAsyncValue,
    required this.kakaoAsyncValue,
  });

  MaeumgagymReIssueState copyWith(
          {AsyncValue<int>? googleAsyncValue,
          AsyncValue<int>? kakaoAsyncValue}) =>
      MaeumgagymReIssueState(
        googleAsyncValue: googleAsyncValue ?? this.googleAsyncValue,
        kakaoAsyncValue: kakaoAsyncValue ?? this.kakaoAsyncValue,
      );
}
