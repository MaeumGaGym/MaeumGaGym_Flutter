import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../domain/model/maeumgagym_sign_up_model.dart';

class MaeumgagymSignUpRemoteDataSource {
  Future<MaeumgagymSignUpModel> googleSignUp(
      String googleToken, String name) async {
    debugPrint('googleToken : $googleToken');
    debugPrint('name : $name');

    Map<String, String> data = {"nickname": name};

    final Map<String, dynamic> queryParam = {
      "access_token": googleToken,
    };

    try {
      return await dio
          .post('/google/signup', queryParameters: queryParam, data: data)
          .then((response) {
        debugPrint(response.statusCode.toString());
        return MaeumgagymSignUpModel.fromJson(
          response.statusCode ?? 0,
        );
      });
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<MaeumgagymSignUpModel> kakaoSignUp(
      String kakaoToken, String name) async {
    Map<String, String> data = {"nickname": name};

    final Map<String, dynamic> queryParam = {
      "access_token": kakaoToken,
    };

    try {
      return await dio
          .post('/kakao/signup', queryParameters: queryParam, data: data)
          .then((response) {
        debugPrint(response.statusCode.toString());
        return MaeumgagymSignUpModel.fromJson(
          response.statusCode ?? 0,
        );
      });
    } catch (err) {
      throw Exception(err);
    }
  }
}
