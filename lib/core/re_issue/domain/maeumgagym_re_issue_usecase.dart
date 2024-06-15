import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_repository.dart';

import '../../di/init.dart';
import 'maeumgagym_re_issue_model.dart';

class MaeumgagymReIssueUseCase {
  final MaeumgagymReIssueRepository _repository =
      locator<MaeumgagymReIssueRepository>();

  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    return await _repository.getReIssue(refreshToken);
  }
}
