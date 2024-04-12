import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/local/pose_all_local_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../../di/token_secure_storage_di.dart';
import '../../../domain/model/pose_data_list_model.dart';

class PoseAllRemoteDataSource {
  final PoseAllLocalDataSource _poseAllLocalDataSource =
      PoseAllLocalDataSource();

  Future<List<PoseDataModel>> getPoseDataList(
      {required String lastUpdated}) async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    Map<String, String> data = {
      "last_updated": lastUpdated,
    };

    debugPrint(lastUpdated);

    try {
      final response = await dio.get(
        '/poses/all',
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode! == 200) {
        await _poseAllLocalDataSource.setPoseDataList(
          PoseDataListModel.fromJson(response.data),
        );

        return await _poseAllLocalDataSource.getPoseDataList();
      } else {
        return await _poseAllLocalDataSource.getPoseDataList();
      }
    } catch (err) {
      debugPrint("------$err-----");
      return [];
    }
  }
}
