import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_re_issue_repository.dart';

import '../model/maeumgagym_re_issue_model.dart';

class MaeumgagymReIssueUseCase {
  final MaeumgagymReIssueRepository _repository;

  MaeumgagymReIssueUseCase(this._repository);

  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    return await _repository.getReIssue(refreshToken);
  }
}
