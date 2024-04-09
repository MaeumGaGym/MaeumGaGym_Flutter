import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../core/di/token_secure_storage_di.dart';
import '../../../domain/model/pose_detail_model.dart';

class PoseDetailRemoteDataSource {
  Future<PoseDetailModel> getDetailData({required int id}) async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    try {
      return await dio
          .get(
        '/poses/$id',
        options: Options(headers: headers),
      )
          .then((response) {
        return PoseDetailModel.fromJson(response.data, response.statusCode!);
      });
    } catch (err) {
      debugPrint(err.toString());
      return PoseDetailModel(
        simpleName: null,
        exactName: null,
        thumbnail: null,
        poseImage: null,
        simplePart: null,
        exactPart: null,
        startPose: null,
        exerciseWay: null,
        breatheWay: null,
        caution: null,
        statusCode: AsyncError(err, StackTrace.empty),
      );
    }
  }
}
