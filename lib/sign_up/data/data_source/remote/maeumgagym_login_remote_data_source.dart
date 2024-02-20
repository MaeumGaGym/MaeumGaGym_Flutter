import 'package:flutter/cupertino.dart';
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
          response.statusCode ?? 404,
        );
      });
    } catch (err) {
      throw Exception(err);
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
      throw Exception(err);
    }
  }
}
