import 'package:dio/dio.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/profile/profile_response_model.dart';

class ProfileRemoteDataSource {
  Future<ProfileResponseModel> getUserProfile({
    required String accessToken,
    required String nickname,
  }) async {
    try {
      return dio
          .get(
        "/user/$nickname",
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
}