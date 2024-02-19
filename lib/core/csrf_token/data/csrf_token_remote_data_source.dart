import 'package:dio/dio.dart';
import 'package:maeum_ga_gym_flutter/core/base_url.dart';

import '../domain/csrf_token_model.dart';

class CSRFTokenRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<CSRFTokenModel> getCSRFToken() async {
    try {
      return _dio
          .get('/public/csrf')
          .then((response) => CSRFTokenModel.fromJson(response.headers));
    } catch (err) {
      throw Exception(err);
    }
  }
}
