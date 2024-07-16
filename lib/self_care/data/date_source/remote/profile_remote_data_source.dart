import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';

class ProfileRemoteDataSource {
  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
  }) async {
    try {
      return dio
          .get(
        "/user",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
          },
        ),
      )
          .then((response) {
        return ProfileResponseModel.fromJson(
          response.data,
          response.statusCode!,
        );
      });
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<AsyncValue<int?>> editUserProfile({
    required String accessToken,
    required String nickname,
    required double weight,
    required double height,
    required String gender,
  }) async {
    Map<String, dynamic> data = {
      "nickname": nickname,
      "weight": weight,
      "height": height,
      "gender": gender,
    };

    try {
      return dio
          .put(
        "/user",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
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

  Future<AsyncValue<int?>> deleteUser({
    required String accessToken,
  }) async {
    try {
      return dio
          .delete(
        "/auth",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": accessToken,
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
}
