import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../domain/csrf_token_model.dart';

class CSRFTokenRemoteDataSource {
  Future<CSRFTokenModel> getCSRFToken() async {
    try {
      return dio
          .get('/public/csrf')
          .then((response) => CSRFTokenModel.fromJson(response.headers));
    } catch (err) {
      throw Exception(err);
    }
  }
}
