import '../../domain/repository/social_login_repository.dart';
import '../data_source/remote/kakao_login_remote_data_source.dart';

class KaKaoLoginRepositoryImpl implements SocialLoginRepository {
  final KaKaoLoginRemoteDataSource _dataSource = KaKaoLoginRemoteDataSource();

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
