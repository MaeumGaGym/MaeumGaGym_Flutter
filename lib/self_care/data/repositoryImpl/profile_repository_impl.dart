import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/date_source/remote/profile_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource = ProfileRemoteDataSource();

  @override
  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  }) async {
    return await _remoteDataSource.getUserProfile(
      accessToken: accessToken,
      nickname: nickname,
    );
  }

  @override
  Future<AsyncValue<int?>> editUserProfile({
    required String accessToken,
    required String nickname,
    required double weight,
    required double height,
    required String gender,
  }) async {
    return await _remoteDataSource.editUserProfile(
      accessToken: accessToken,
      nickname: nickname,
      weight: weight,
      height: height,
      gender: gender,
    );
  }
}
