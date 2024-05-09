import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/data/maeumgagym_re_issue_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_repository.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_usecase.dart';

import '../../di/init.dart';
import '../../di/token_secure_storage_di.dart';

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

  final MaeumgagymReIssueUseCase _useCase = MaeumgagymReIssueUseCase();

  Future<void> getReIssue(String refreshToken) async {
    state = state.copyWith(stateus: const AsyncLoading());

    MaeumgagymReIssueModel reIssueToken =
        await _useCase.getReIssue(refreshToken);

    await TokenSecureStorageDi.writeLoginAccessToken(reIssueToken.accessToken);
    await TokenSecureStorageDi.writeLoginRefreshToken(
        reIssueToken.refreshToken);
    state = state.copyWith(stateus: reIssueToken.stateus);
  }
}
