import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_history_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/routine_response_model.dart';

class RoutineRemoteDataSource {
  Future<AsyncValue<int?>> createRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    required List<ExerciseInfoModel> exerciseInfoModelList,
    List<String>? dayOfWeeks,
  }) async {
    Map<String, dynamic> data = {
      "routine_name": routineName,
      "is_archived": isArchived,
      "is_shared": isShared,
      "exercise_info_model_list": exerciseInfoModelList,
      "day_of_weeks": dayOfWeeks,
    };
    try {
      return await dio
          .post(
        '/routines',
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<RoutineResponseModel> getTodayRoutine({
    required String accessToken,
  }) async {
    try {
      return await dio
          .get(
        "/routines/today",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return RoutineResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return RoutineResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        id: null,
        routineName: null,
        exerciseInfoList: null,
        dayOfWeeks: null,
        routineStatus: null,
      );
    }
  }

  Future<AsyncValue<int?>> deleteRoutine({
    required String accessToken,
    required String routineId,
  }) async {
    try {
      return await dio
          .delete(
        "/routines/$routineId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<AsyncValue<int?>> editRoutine({
    required String accessToken,
    required String routineName,
    required bool isArchived,
    required bool isShared,
    List<ExerciseInfoModel>? exerciseInfoModelList,
    required int routineId,
    List<String>? dayOfWeeks,
  }) async {
    Map<String, dynamic> data = {
      "routine_name": routineName,
      "is_archived": isArchived,
      "is_shared": isShared,
      "exercise_info_model_list": exerciseInfoModelList,
      "day_of_weeks": dayOfWeeks,
    };
    try {
      return await dio
          .put(
        "/routines/$routineId",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<AsyncValue<int?>> completeTodayRoutines({
    required String accessToken,
  }) async {
    try {
      return await dio
          .put(
        "/routines/today/complete",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return AsyncData(response.statusCode);
      });
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }

  Future<RoutineHistoryModel> getRoutineHistory({
    required String accessToken,
    required String date,
  }) async {
    try {
      return await dio
          .get(
        "/routines/histories/$date",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      )
          .then((response) {
        return RoutineHistoryModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return RoutineHistoryModel(
        statusCode: AsyncError(err, StackTrace.empty),
        id: null,
        routineName: null,
        exerciseInfoList: null,
        date: null,
      );
    }
  }
}
