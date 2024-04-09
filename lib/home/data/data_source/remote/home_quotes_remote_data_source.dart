import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';

import '../../../domain/model/home_quotes_model.dart';

class HomeQuotesRemoteDataSource {
  Future<HomeQuotesModel> getQuotes() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio.get('/quotes', options: Options(headers: headers)).then(
            (response) => HomeQuotesModel.fromJson(
              response.data,
              AsyncData(response.statusCode!),
            ),
          );
    } catch (err) {
      return HomeQuotesModel(
        statusCode: AsyncError(err, StackTrace.empty),
        message: null,
        author: null,
      );
    }
  }
}
