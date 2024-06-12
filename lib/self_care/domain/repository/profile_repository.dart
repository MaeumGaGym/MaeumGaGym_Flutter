import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';

abstract class ProfileRepository {
  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  });
}
