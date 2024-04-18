import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/routine_repository.dart';

class RoutineUseCase {
  final RoutineRepository _repository;

  RoutineUseCase(this._repository);

  Future<AsyncValue<int?>> createRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoModelList,
    List<String>? dayOfWeeks,
  }) async {
    return await _repository.createRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoModelList: exerciseInfoModelList,
      dayOfWeeks: dayOfWeeks,
    );
  }

  Future<RoutineAndUserInfoModel> getRoutineAllMe({
    required String accessToken,
  }) async {
    return await _repository.getRoutineAllMe(
      accessToken: accessToken,
    );
  }

  Future<RoutineResponseModel> getTodayRoutine({
    required String accessToken,
  }) async {
    return await _repository.getTodayRoutine(
      accessToken: accessToken,
    );
  }

  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required String routineId,
  }) async {
    return await _repository.deleteRoutine(
        accessToken: accessToken, routineId: routineId);
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
