import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/profile_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/profile_usecase.dart';

final selfCareProfileGetProfileProvider = StateNotifierProvider<
    SelfCareUserGetProfileStateNotifier, ProfileResponseModel>(
  (ref) => SelfCareUserGetProfileStateNotifier(),
);

class SelfCareUserGetProfileStateNotifier
    extends StateNotifier<ProfileResponseModel> {
  SelfCareUserGetProfileStateNotifier()
      : super(
        ProfileResponseModel(
            statusCode: const AsyncData(500),
            nickname: null,
            profileImage: null,
            level: null,
            totalWakatime: null,
          ),
        );

  final ProfileUseCase _userUseCase = ProfileUseCase(ProfileRepositoryImpl());

  String? accessToken;

  Future<void> getUserProfile() async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();
      state = await _userUseCase.getUserProfile(accessToken: accessToken!);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
