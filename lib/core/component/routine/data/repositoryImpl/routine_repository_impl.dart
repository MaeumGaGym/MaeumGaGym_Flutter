import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/data/datasource/remote/routine_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/repository/routine_repository.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  final RoutineRemoteDataSource _remoteDataSource = RoutineRemoteDataSource();

  @override
  Future<RoutineResponseModel> getTodayRoutine({
    required String accessToken,
  }) async {
    return await _remoteDataSource.getTodayRoutine(
      accessToken: accessToken,
    );
  }

  @override
  Future<RoutineAndUserInfoModel> getMyRoutine({
    required String accessToken,
    required int index,
  }) async {
    return await _remoteDataSource.getMyRoutine(
      accessToken: accessToken,
      index: index,
    );
  }

  @override
  Future<AsyncValue<int?>> completeTodayRoutines({
    required String accessToken,
  }) async {
    return await _remoteDataSource.completeTodayRoutines(
      accessToken: accessToken,
    );
  }

  @override
  Future<AsyncValue<int?>> addRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    List<String>? dayOfWeeks,
  }) async {
    return await _remoteDataSource.addRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoRequestList: exerciseInfoRequestList,
      dayOfWeeks: dayOfWeeks,
    );
  }

  @override
  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required int routineId,
  }) async {
    return await _remoteDataSource.deleteRoutine(
      accessToken: accessToken,
      routineId: routineId,
    );
  }

  @override
  Future<AsyncValue<int?>> editRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoRequestModel> exerciseInfoRequestList,
    required int routineId,
    required List<String> dayOfWeeks,
  }) async {
    return await _remoteDataSource.editRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoRequestList: exerciseInfoRequestList,
      routineId: routineId,
      dayOfWeeks: dayOfWeeks,
    );
  }

  @override
  Future<RoutineHistoryModel> getRoutineHistory({
    required String accessToken,
    required String date,
  }) async {
    return await _remoteDataSource.getRoutineHistory(
      accessToken: accessToken,
      date: date,
    );
  }
}
