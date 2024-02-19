import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/maeumgagym_login_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/model/maeumgagym_login_model.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_login_repository.dart';

class MaeumgagymLoginRepositoryImpl implements MaeumgagymLoginRepository {
  final MaeumgagymLoginRemoteDataSource _dataSource =
      MaeumgagymLoginRemoteDataSource();

  @override
  Future<MaeumgagymLoginModel> googleLogin(String googleToken) async {
    return await _dataSource.googleLogin(googleToken);
  }
}
