import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../../di/token_secure_storage_di.dart';
import '../../../domain/model/pose_tag_list_model.dart';

class PoseTagListRemoteDataSource {
  Future<PoseTagListModel> getTagList({required String tag}) async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    Map<String, String> param = {
      "tag": tag,
    };

    debugPrint(tag);

    try {
      return await dio
          .get(
            '/poses/tag',
            queryParameters: param,
            options: Options(headers: headers),
          )
          .then(
            (response) => PoseTagListModel.fromJson(
              response.data,
              response.statusCode!,
            ),
          );
    } catch (err) {
      debugPrint(err.toString());
      return PoseTagListModel(
        responses: [],
        statusCode: AsyncError(err, StackTrace.empty),
      );
    }
  }
}
