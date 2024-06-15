import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/dio_di.dart';

class MaeumgagymRecoveryRemoteDataSource {
  Future<AsyncValue<int>> googleRecovery(String googleToken) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": googleToken};

    try {
      return await dio
          .put('/google/recovery', options: Options(headers: header))
          .then((response) {
        return AsyncData(response.statusCode!);
      });
    } catch (err) {
      if (err.toString().contains('404')) {
        return const AsyncData(404);
      } else {
        return AsyncError(err, StackTrace.empty);
      }
    }
  }

  Future<AsyncValue<int>> kakaoRecovery(String kakaoToken) async {
    Map<String, dynamic> header = {"OAUTH-TOKEN": kakaoToken};

    try {
      return await dio
          .put('/kakao/recovery', options: Options(headers: header))
          .then((response) {
        return AsyncData(response.statusCode!);
      });
    } catch (err) {
      if (err.toString().contains('404')) {
        return const AsyncData(404);
      } else {
        return AsyncError(err, StackTrace.empty);
      }
    }
  }
}
