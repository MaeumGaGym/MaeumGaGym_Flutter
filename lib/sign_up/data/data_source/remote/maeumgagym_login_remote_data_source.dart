import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/model/maeumgagym_login_model.dart';

import 'package:maeum_ga_gym_flutter/core/base_url.dart';

class MaeumgagymLoginRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

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
}
