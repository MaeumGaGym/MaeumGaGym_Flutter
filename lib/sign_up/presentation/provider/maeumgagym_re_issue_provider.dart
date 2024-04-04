import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/repositoryImpl/maeumgagym_re_issue_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/usecase/maeumgagym_re_issue_usecase.dart';

import '../../../core/di/token_secure_storage_di.dart';

final maeumgagymReIssueController = StateNotifierProvider<
    MaeumgagymReIssueStateNotifier, MaeumgagymReIssueModel>((ref) {
  return MaeumgagymReIssueStateNotifier();
});

class MaeumgagymReIssueStateNotifier
    extends StateNotifier<MaeumgagymReIssueModel> {
  MaeumgagymReIssueStateNotifier()
      : super(MaeumgagymReIssueModel(
          stateus: const AsyncData(500),
          accessToken: null,
          refreshToken: null,
        ));

  final MaeumgagymReIssueUseCase _useCase =
      MaeumgagymReIssueUseCase(MaeumgagymReIssueRepositoryImpl());

  Future<void> getReIssue(String refreshToken, LoginOption loginOption) async {
    state = state.copyWith(stateus: const AsyncLoading());

    MaeumgagymReIssueModel reIssueToken =
        await _useCase.getReIssue(refreshToken);

    await TokenSecureStorageDi.writeLoginAccessToken(reIssueToken.accessToken);
    await TokenSecureStorageDi.writeLoginRefreshToken(
        reIssueToken.refreshToken);
    state = state.copyWith(stateus: reIssueToken.stateus);
  }
}
