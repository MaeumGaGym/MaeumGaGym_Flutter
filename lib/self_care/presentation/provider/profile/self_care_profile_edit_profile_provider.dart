import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/profile_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/profile_usecase.dart';

final selfCareProfileEditProfileProvider = StateNotifierProvider<
    SelfCareProfileEditProfileStateNotifier,
    AsyncValue<int?>>((ref) => SelfCareProfileEditProfileStateNotifier());

class SelfCareProfileEditProfileStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCareProfileEditProfileStateNotifier() : super(const AsyncData(500));

  final ProfileUseCase _userUseCase = ProfileUseCase(ProfileRepositoryImpl());

  String? accessToken;

  Future<void> editUserProfile({
    required String nickname,
    required double weight,
    required double height,
    required String gender,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();
      final response = await _userUseCase.editUserProfile(
        accessToken: accessToken!,
        nickname: nickname,
        weight: weight,
        height: height,
        gender: gender,
      );
      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
