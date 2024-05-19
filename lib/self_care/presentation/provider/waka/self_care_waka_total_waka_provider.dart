import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/waka_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/waka/waka_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/waka_usecase.dart';

final selfCareWakaTotalWakaProvider = StateNotifierProvider<SelfCareWakaTotalWakaStateNotifier, WakaResponseModel>((ref) => SelfCareWakaTotalWakaStateNotifier());

class SelfCareWakaTotalWakaStateNotifier
    extends StateNotifier<WakaResponseModel> {
  SelfCareWakaTotalWakaStateNotifier()
      : super(
          WakaResponseModel(
            statusCode: const AsyncData(500),
            totalSeconds: null,
          ),
        );

  final WakaUseCase _wakaUseCase = WakaUseCase(WakaRepositoryImpl());

  String? accessToken;

  Future<void> totalWaka() async {
    try {
      state = state.copyWith(statusCode: const AsyncLoading());
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();
      final response = await _wakaUseCase.totalWaka(accessToken: accessToken!);
      state = state.copyWith(statusCode: response.statusCode, totalSeconds: response.totalSeconds);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
