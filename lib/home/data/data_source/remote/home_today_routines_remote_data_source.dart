import 'package:dio/dio.dart';
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
