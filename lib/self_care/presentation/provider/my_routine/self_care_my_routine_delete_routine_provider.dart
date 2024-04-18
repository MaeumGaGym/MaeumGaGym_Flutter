import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/routine_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/routine_usecase.dart';

final selfCareMyRoutineDeleteRoutineProvider = StateNotifierProvider<
    SelfCareMyRoutineDeleteRoutineStateNotifier, AsyncValue<int?>>(
  (ref) => SelfCareMyRoutineDeleteRoutineStateNotifier(),
);

class SelfCareMyRoutineDeleteRoutineStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCareMyRoutineDeleteRoutineStateNotifier() : super(const AsyncData(500));

  final RoutineUseCase _routineUseCase =
      RoutineUseCase(RoutineRepositoryImpl());

  String? accessToken;

  Future<void> deleteRoutine({
    required int routineId,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _routineUseCase.deleteRoutine(
        accessToken: accessToken!,
        routineId: routineId,
      );

      state = response;
      print(routineId);
      print(response);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
