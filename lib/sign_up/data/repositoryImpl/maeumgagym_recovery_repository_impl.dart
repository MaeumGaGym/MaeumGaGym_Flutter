import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/maeumgagym_recovery_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_recovery_repository.dart';

class MaeumgagymRecoveryRepositoryImpl implements MaeumgagymRecoveryRepository {
  final MaeumgagymRecoveryRemoteDataSource _dataSource =
      MaeumgagymRecoveryRemoteDataSource();

  @override
  Future<AsyncValue<int>> googleRecovery(String googleToken) async {
    return await _dataSource.googleRecovery(googleToken);
  }

  @override
  Future<AsyncValue<int>> kakaoRecovery(String kakaoToken) async {
    return await _dataSource.kakaoRecovery(kakaoToken);
  }
}
