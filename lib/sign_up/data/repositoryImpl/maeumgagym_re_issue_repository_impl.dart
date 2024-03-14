import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/maeumgagym_re_issue_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_re_issue_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_re_issue_repository.dart';

class MaeumgagymReIssueRepositoryImpl implements MaeumgagymReIssueRepository {
  final MaeumgagymReIssueRemoteDataSource _dataSource =
      MaeumgagymReIssueRemoteDataSource();

  @override
  Future<MaeumgagymReIssueModel> getReIssue(String refreshToken) async {
    return await _dataSource.getReIssue(refreshToken);
  }
}
