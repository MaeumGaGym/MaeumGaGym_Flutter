import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/dio_di.dart';

class MaeumgagymRecoveryRemoteDataSource {
  Future<AsyncValue<int>> googleRecovery(String googleToken) async {
    final Map<String, dynamic> queryParam = {
      "access_token": googleToken,
    };

    try {
      return await dio
          .put('/google/recovery', queryParameters: queryParam)
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
    final Map<String, dynamic> queryParam = {
      "access_token": kakaoToken,
    };

    try {
      return await dio
          .put('/kakao/recovery', queryParameters: queryParam)
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
