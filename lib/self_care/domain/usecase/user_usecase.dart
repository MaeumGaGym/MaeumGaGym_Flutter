import 'package:maeum_ga_gym_flutter/self_care/domain/model/user/user_profile_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase(this._repository);

  Future<UserProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  }) async {
    return await _repository.getUserProfile(
      accessToken: accessToken,
      nickname: nickname,
    );
  }
}
