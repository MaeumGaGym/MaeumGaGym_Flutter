import '../../domain/repository/social_login_repository.dart';
import '../data_source/remote/google_login_remote_data_source.dart';

class GoogleLoginRepositoryImpl implements SocialLoginRepository {
  final GoogleLoginRemoteDataSource _dataSource = GoogleLoginRemoteDataSource();

  @override
  Future<String> getToken() {
    return _dataSource.getToken();
  }

  @override
  Future<bool> login() {
    return _dataSource.login();
  }

  @override
  Future<bool> logout() {
    return _dataSource.logout();
  }
}
