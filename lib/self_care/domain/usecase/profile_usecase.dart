import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<AsyncValue<int?>> editUserProfile({
    required String accessToken,
    required String nickname,
    required double weight,
    required double height,
    required String gender,
  }) async {
    return await _repository.editUserProfile(
      accessToken: accessToken,
      nickname: nickname,
      weight: weight,
      height: height,
      gender: gender,
    );
  }
}
