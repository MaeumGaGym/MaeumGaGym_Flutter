import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';

abstract class ProfileRepository {
  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
  });

  Future<AsyncValue<int?>> editUserProfile({
    required String accessToken,
    required String nickname,
    required double weight,
    required double height,
    required String gender,
  });

  Future<AsyncValue<int?>> deleteUser({
    required String accessToken,
  });
}
