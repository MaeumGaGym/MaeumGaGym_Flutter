import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      : super(MaeumgagymReIssueState(stateusCode: 0));

  final MaeumgagymReIssueUseCase _useCase =
      MaeumgagymReIssueUseCase(MaeumgagymReIssueRepositoryImpl());

  Future<void> getReIssue(String refreshToken) async {
    MaeumgagymReIssueModel reIssueToken =
        await _useCase.getReIssue(refreshToken);
    await TokenSecureStorageDi.writeAccessToken(reIssueToken.accessToken);
    await TokenSecureStorageDi.writeRefreshToken(reIssueToken.refreshToken);

    state = MaeumgagymReIssueState(stateusCode: reIssueToken.statusCode);
  }
}

class MaeumgagymReIssueState {
  final int stateusCode;

  MaeumgagymReIssueState({required this.stateusCode});
}
