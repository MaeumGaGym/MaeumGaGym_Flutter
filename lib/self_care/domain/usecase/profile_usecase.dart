import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);

  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  }) async {
    return await _repository.getUserProfile(
      accessToken: accessToken,
      nickname: nickname,
    );
  }
}
