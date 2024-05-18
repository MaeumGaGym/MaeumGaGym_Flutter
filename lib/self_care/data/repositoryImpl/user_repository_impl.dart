import 'package:maeum_ga_gym_flutter/self_care/data/date_source/remote/user_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/user/user_profile_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource = UserRemoteDataSource();

  @override
  Future<UserProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  }) async {
    return await _remoteDataSource.getUserProfile(
      accessToken: accessToken,
      nickname: nickname,
    );
  }
}
