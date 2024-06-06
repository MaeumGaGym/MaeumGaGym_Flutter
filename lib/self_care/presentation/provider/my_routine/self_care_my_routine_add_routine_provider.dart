import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/data/repositoryImpl/routine_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/usecase/routine_usecase.dart';

final selfCareMyRoutineAddRoutineProvider = StateNotifierProvider<SelfCareMyRoutineAddRoutineStateNotifier, AsyncValue<int?>>((ref) => SelfCareMyRoutineAddRoutineStateNotifier());

class SelfCareMyRoutineAddRoutineStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  SelfCareMyRoutineAddRoutineStateNotifier() : super(const AsyncData(500));

  final RoutineUseCase _routineUseCase =
      RoutineUseCase(RoutineRepositoryImpl());

  String? accessToken;

  Future<void> addRoutine({
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    List<String>? dayOfWeeks,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _routineUseCase.addRoutine(
        accessToken: accessToken!,
        routineName: routineName,
        isArchived: isArchived,
        isShared: isShared,
        exerciseInfoRequestList: exerciseInfoRequestList,
        dayOfWeeks: dayOfWeeks,
      );
      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
