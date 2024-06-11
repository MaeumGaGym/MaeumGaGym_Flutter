import 'package:maeum_ga_gym_flutter/core/logout/data/maeumgagym_logout_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/logout/domain/maeumgagym_logout_repository.dart';
import 'package:maeum_ga_gym_flutter/core/model/social_login_model.dart';

class MaeumgagymLogoutRepositoryImpl implements MaeumgagymLogoutRepository {
  final MaeumgagymLogoutRemoteDataSource _dataSource = MaeumgagymLogoutRemoteDataSource();

  @override
  Future<SocialLoginModel> logout() async {
    return await _dataSource.logout();
  }
}