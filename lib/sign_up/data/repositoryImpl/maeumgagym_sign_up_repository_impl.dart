import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/sign_up/data/data_source/remote/maeumgagym_sign_up_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/sign_up/domain/repository/maeumgagym_sign_up_repository.dart';

class MaeumgagymSignUpRepositoryImpl implements MaeumgagymSignUpRepository {
  final MaeumgagymSignUpRemoteDataSource _dataSource =
      MaeumgagymSignUpRemoteDataSource();

  @override
  Future<AsyncValue<int?>> googleSignUp(String googleToken, String name) async {
    return await _dataSource.googleSignUp(googleToken, name);
  }

  @override
  Future<AsyncValue<int?>> kakaoSignUp(String kakaoToken, String name) async {
    return await _dataSource.kakaoSignUp(kakaoToken, name);
  }
}
