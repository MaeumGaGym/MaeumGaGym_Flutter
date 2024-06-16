import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/data/repositoryImpl/routine_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/usecase/routine_usecase.dart';

final routineMyRoutineEditRoutineProvider = StateNotifierProvider<
    RoutineMyRoutineEditRoutineStateNotifier,
    AsyncValue<int?>>((ref) => RoutineMyRoutineEditRoutineStateNotifier());

class RoutineMyRoutineEditRoutineStateNotifier
    extends StateNotifier<AsyncValue<int?>> {
  RoutineMyRoutineEditRoutineStateNotifier() : super(const AsyncData(500));

  final RoutineUseCase _routineUseCase =
      RoutineUseCase(RoutineRepositoryImpl());

  String? accessToken;

  Future<void> editRoutine({
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    required int routineId,
    required List<String> dayOfWeeks,
  }) async {
    try {
      state = const AsyncLoading();
      accessToken = await TokenSecureStorageDi.readLoginAccessToken();

      final response = await _routineUseCase.editRoutine(
        accessToken: accessToken!,
        routineName: routineName,
        isArchived: isArchived,
        isShared: isShared,
        exerciseInfoRequestList: exerciseInfoRequestList,
        routineId: routineId,
        dayOfWeeks: dayOfWeeks,
      );
      state = response;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
