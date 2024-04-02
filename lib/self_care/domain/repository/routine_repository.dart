import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';

abstract class RoutineRepository {
  Future<AsyncValue<int?>> createRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoModel> exerciseInfoModelList,
    List<String>? dayOfWeeks,
  });

  Future<RoutineResponseModel> getTodayRoutine({
    required String accessToken,
  });

  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required String routineId,
  });

  Future<AsyncValue<int?>> editRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    List<ExerciseInfoModel>? exerciseInfoModelList,
    required int routineId,
    List<String>? dayOfWeeks,
  });

  Future<AsyncValue<int?>> completeTodayRoutines({
    required String accessToken,
  });

  Future<RoutineHistoryModel> getRoutineHistory({
    required String accessToken,
    required String date,
  });
}
