import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../core/di/token_secure_storage_di.dart';
import '../../../../core/model/routine/maeumgagym_routine_list_model.dart';

class HomeTodayRoutinesRemoteDataSource {
  Future<MaeumgagymRoutineListModel> getTodayRoutines() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .get('/routines/today', options: Options(headers: headers))
          .then(
            (response) => MaeumgagymRoutineListModel.fromJson(
              response.data,
              response.statusCode,
            ),
          );
    } catch (err) {
      return MaeumgagymRoutineListModel(
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

  Future<AsyncValue<int>> incompleteTodayRoutines(int id) async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    DateTime nowDate = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(nowDate);

    try {
      return await dio
          .put('/routines/incomplete/$date/$id', options: Options(headers: headers))
          .then((response) => AsyncData(response.statusCode!));
    } catch (err) {
      return AsyncError(err, StackTrace.empty);
    }
  }
}
