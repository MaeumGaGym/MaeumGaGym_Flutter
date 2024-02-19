import 'package:maeum_ga_gym_flutter/core/csrf_token/data/csrf_token_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_model.dart';
import 'package:maeum_ga_gym_flutter/core/csrf_token/domain/csrf_token_repository.dart';

class CSRFTokenRepositoryImpl implements CSRFTokenRepository {
  final CSRFTokenRemoteDataSource _dataSource = CSRFTokenRemoteDataSource();

  @override
  Future<CSRFTokenModel> getCSRFToken() async {
    return _dataSource.getCSRFToken();
  }
}
