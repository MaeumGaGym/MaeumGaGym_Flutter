import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/repository/routine_repository.dart';

class RoutineUseCase {
  final RoutineRepository _repository;

  RoutineUseCase(this._repository);

  Future<AsyncValue<int?>> addRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    List<String>? dayOfWeeks,
  }) async {
    return await _repository.addRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoRequestList: exerciseInfoRequestList,
      dayOfWeeks: dayOfWeeks,
    );
  }

  Future<RoutineAndUserInfoModel> getMyRoutine({
    required String accessToken,
    required int index,
  }) async {
    return await _repository.getMyRoutine(
      accessToken: accessToken,
      index: index,
    );
  }

  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required int routineId,
  }) async {
    return await _repository.deleteRoutine(
      accessToken: accessToken,
      routineId: routineId,
    );
  }

  Future<AsyncValue<int?>> editRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    required int routineId,
    required List<String> dayOfWeeks,
  }) async {
    return await _repository.editRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoRequestList: exerciseInfoRequestList,
      routineId: routineId,
      dayOfWeeks: dayOfWeeks,
    );
  }

  Future<AsyncValue<int?>> completeTodayRoutines({
    required String accessToken,
  }) async {
    return await _repository.completeTodayRoutines(
      accessToken: accessToken,
    );
  }

  Future<RoutineHistoryModel> getRoutineHistory({
    required String accessToken,
    required String date,
  }) async {
    return await _repository.getRoutineHistory(
      accessToken: accessToken,
      date: date,
    );
  }
}
