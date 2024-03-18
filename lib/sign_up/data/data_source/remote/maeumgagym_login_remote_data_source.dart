import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/maeumgagym_login_model.dart';

import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

class MaeumgagymLoginRemoteDataSource {
  Future<MaeumgagymLoginModel> googleLogin(String googleToken) async {
    try {
      return await dio.get('/google/login', queryParameters: {
        'access_token': googleToken,
      }).then((response) {
        debugPrint(response.statusCode.toString());
        return MaeumgagymLoginModel.fromJson(
          response.headers,
          response.statusCode!,
        );
      });
    } catch (err) {
      if (err.toString().contains('404')) {
        return MaeumgagymLoginModel(
          statusCode: const AsyncData(404),
          accessToken: null,
          refreshToken: null,
        );
      }
      return MaeumgagymLoginModel(
        statusCode: AsyncError(err, StackTrace.empty),
        accessToken: null,
        refreshToken: null,
      );
    }
  }

  Future<MaeumgagymLoginModel> kakaoLogin(String kakaoToken) async {
    try {
      return await dio.get('/kakao/login', queryParameters: {
        'access_token': kakaoToken,
      }).then((response) {
        debugPrint(response.statusCode.toString());
        return MaeumgagymLoginModel.fromJson(
          response.headers,
          response.statusCode ?? 404,
        );
      });
    } catch (err) {
      if (err.toString().contains('404')) {
        return MaeumgagymLoginModel(
          statusCode: const AsyncData(404),
          accessToken: null,
          refreshToken: null,
        );
      }
      return MaeumgagymLoginModel(
        statusCode: AsyncError(err, StackTrace.empty),
        accessToken: null,
        refreshToken: null,
      );
    }
  }
}
