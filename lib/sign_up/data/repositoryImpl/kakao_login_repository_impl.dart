import '../../domain/model/social_login_model.dart';
import '../../domain/repository/social_login_repository.dart';
import '../data_source/remote/kakao_login_remote_data_source.dart';

class KaKaoLoginRepositoryImpl implements SocialLoginRepository {
  final KaKaoLoginRemoteDataSource _dataSource = KaKaoLoginRemoteDataSource();

  @override
  Future<SocialLoginModel> login() async {
    return await _dataSource.login();
  }

  @override
  Future<SocialLoginModel> logout() async {
    return await _dataSource.logout();
  }
}
