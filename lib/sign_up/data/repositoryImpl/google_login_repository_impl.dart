import '../../../core/model/social_login_model.dart';
import '../../domain/repository/social_login_repository.dart';
import '../data_source/remote/google_login_remote_data_source.dart';

class GoogleLoginRepositoryImpl implements SocialLoginRepository {
  final GoogleLoginRemoteDataSource _dataSource = GoogleLoginRemoteDataSource();

  @override
  Future<SocialLoginModel> login() async {
    return await _dataSource.login();
  }
}
