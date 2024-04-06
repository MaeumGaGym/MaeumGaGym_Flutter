import 'package:maeum_ga_gym_flutter/self_care/data/date_source/remote/routine_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_and_user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/user_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/routine_repository.dart';
import 'package:riverpod/src/common.dart';

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
  Future<RoutineAndUserInfoModel> getRoutineAllMe({
    required String accessToken,
  }) async {
    return await _remoteDataSource.getRoutineAllMe(
      accessToken: accessToken,
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
  Future<AsyncValue<int?>> createRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoResponseModel> exerciseInfoModelList,
    List<String>? dayOfWeeks,
  }) async {
    return await _remoteDataSource.createRoutine(
        accessToken: accessToken,
        routineName: routineName,
        isArchived: isArchived,
        isShared: isShared,
        exerciseInfoModelList: exerciseInfoModelList,
        dayOfWeeks: dayOfWeeks);
  }

  @override
  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required String routineId,
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
    List<ExerciseInfoResponseModel>? exerciseInfoModelList,
    required int routineId,
    List<String>? dayOfWeeks,
  }) async {
    return await _remoteDataSource.editRoutine(
      accessToken: accessToken,
      routineName: routineName,
      isArchived: isArchived,
      isShared: isShared,
      exerciseInfoModelList: exerciseInfoModelList,
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
