import 'maeumgagym_re_issue_model.dart';

abstract class MaeumgagymReIssueRepository {
  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken);
}
