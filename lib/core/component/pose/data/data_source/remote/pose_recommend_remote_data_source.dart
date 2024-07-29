import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';

import '../../../domain/model/pose_recommend_model.dart';

class PoseRecommendRemoteDataSource {
  Future<PoseRecommendListModel> getRecommendPose() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .get('/poses', options: Options(headers: headers))
          .then((response) {
        return PoseRecommendListModel.fromJson(
          response.data,
          response.statusCode,
        );
      });
    } catch (err) {
      debugPrint("-----$err------");
      return PoseRecommendListModel(
        responses: [],
        statusCode: AsyncError(err, StackTrace.empty),
      );
    }
  }
}
