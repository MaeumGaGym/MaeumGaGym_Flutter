import 'package:maeum_ga_gym_flutter/core/re_issue/data/maeumgagym_re_issue_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/domain/maeumgagym_re_issue_repository.dart';

class MaeumgagymReIssueRepositoryImpl implements MaeumgagymReIssueRepository {
  final MaeumgagymReIssueRemoteDataSource _dataSource =
      MaeumgagymReIssueRemoteDataSource();

  @override
  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    return await _dataSource.getReIssue(refreshToken);
  }
}
