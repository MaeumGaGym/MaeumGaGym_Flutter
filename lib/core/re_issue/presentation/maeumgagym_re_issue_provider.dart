import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_usecase.dart';
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
