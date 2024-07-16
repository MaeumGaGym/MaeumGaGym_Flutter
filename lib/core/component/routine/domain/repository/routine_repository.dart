import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_history_model.dart';

abstract class RoutineRepository {
  Future<AsyncValue<int?>> addRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    List<String>? dayOfWeeks,
  });

  Future<RoutineAndUserInfoModel> getMyRoutine({
    required String accessToken,
    required int index,
  });

  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required int routineId,
  });

  Future<AsyncValue<int?>> editRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    required int routineId,
    required List<String> dayOfWeeks,
  });

  Future<AsyncValue<int?>> completeTodayRoutines({
    required String accessToken,
  });

  Future<RoutineHistoryModel> getRoutineHistory({
    required String accessToken,
    required String date,
  });
}
