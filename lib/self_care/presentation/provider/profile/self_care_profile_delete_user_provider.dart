import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/profile_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/profile_usecase.dart';

final selfCareProfileDeleteUserProvider = StateNotifierProvider<
    SelfCareProfileDeleteUserStateNotifier,
    AsyncValue<int?>>((ref) => SelfCareProfileDeleteUserStateNotifier());

class SelfCareProfileDeleteUserStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCareProfileDeleteUserStateNotifier() : super(const AsyncData(500));

  final ProfileUseCase _userUseCase = ProfileUseCase(ProfileRepositoryImpl());

  String? accessToken;

  Future<void> deleteUser() async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _userUseCase.deleteUser(accessToken: accessToken!);

      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
