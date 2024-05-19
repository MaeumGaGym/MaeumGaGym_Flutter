import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/waka/waka_response_model.dart';

class WakaRemoteDataSource {
  Future<WakaResponseModel> totalWaka({
    required String accessToken,
  }) async {
    try {
      return dio
          .get(
        "/waka/total",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return WakaResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return WakaResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        totalSeconds: null,
      );
    }
  }

  Future<WakaResponseModel> dailyWaka({
    required String accessToken,
  }) async {
    try {
      return dio.get(
        "/waka/daily",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return WakaResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      return WakaResponseModel(
        statusCode: AsyncError(err, StackTrace.empty),
        totalSeconds: null,
      );
    }
  }
}
