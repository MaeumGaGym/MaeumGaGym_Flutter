import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/nickname_check_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/nickname_check_repository.dart';

class NicknameCheckRepositoryImpl implements NicknameCheckRepository {
  final NicknameCheckRemoteDataSource _dataSource = NicknameCheckRemoteDataSource();

  @override
  Future<bool> checkNickname(String name) {
    return _dataSource.checkNickname(name);
  }
}
