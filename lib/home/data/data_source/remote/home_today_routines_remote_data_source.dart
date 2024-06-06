import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../core/di/token_secure_storage_di.dart';
import '../../../domain/model/home_today_routines_model.dart';

class HomeTodayRoutinesRemoteDataSource {
  Future<HomeTodayRoutineListModel> getTodayRoutines() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .get('/routines/today', options: Options(headers: headers))
          .then(
            (response) => HomeTodayRoutineListModel.fromJson(
              response.data,
              response.statusCode,
            ),
          );
    } catch (err) {
      return HomeTodayRoutineListModel(
        routineList: [],
        statusCode: AsyncError(err, StackTrace.empty),
      );
    }
  }

  Future<AsyncValue<int>> completeTodayRoutines(int id) async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .put('/routines/today/complete/$id', options: Options(headers: headers))
          .then((response) => AsyncData(response.statusCode!));
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }
}
