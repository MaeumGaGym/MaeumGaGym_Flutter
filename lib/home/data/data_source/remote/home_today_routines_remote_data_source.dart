import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../core/di/token_secure_storage_di.dart';
import '../../../domain/model/home_today_routines_model.dart';

class HomeTodayRoutinesRemoteDataSource {
  Future<HomeTodayRoutinesModel> getTodayRoutines() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .get('/routines/today', options: Options(headers: headers))
          .then(
            (response) => HomeTodayRoutinesModel.fromJson(
              response.data,
              response.statusCode,
            ),
          );
    } catch (err) {
      if (err.toString().contains('401')) {
        return HomeTodayRoutinesModel(
          id: null,
          routineName: null,
          exerciseInfoResponseList: null,
          dayOfWeeks: null,
          routineStatus: null,
          isCompleted: null,
          statusCode: const AsyncError("401 TodayRoutine", StackTrace.empty),
        );
      } else {
        return HomeTodayRoutinesModel(
          id: null,
          routineName: null,
          exerciseInfoResponseList: null,
          dayOfWeeks: null,
          routineStatus: null,
          isCompleted: null,
          statusCode: AsyncError(err, StackTrace.empty),
        );
      }
    }
  }

  Future<AsyncValue<int>> completeTodayRoutines() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .put('/routines/today/complete', options: Options(headers: headers))
          .then((response) => AsyncData(response.statusCode!));
    } catch (err) {
      debugPrint("todayRoutineCompleted : $err");
      if (err.toString().contains('401')) {
        return const AsyncError('401 Complete', StackTrace.empty);
      } else {
        return AsyncError(err, StackTrace.empty);
      }
    }
  }
}
