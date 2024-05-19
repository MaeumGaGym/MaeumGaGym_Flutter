import 'package:maeum_ga_gym_flutter/self_care/domain/model/user/user_profile_response_model.dart';

abstract class UserRepository {
  Future<UserProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  });
}
