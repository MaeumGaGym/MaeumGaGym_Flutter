import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/local/maeumgagym_pose_data_version_local_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/local/pose_all_local_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/di/dio_di.dart';

import '../../../../../di/token_secure_storage_di.dart';
import '../../../domain/model/pose_data_list_model.dart';

class PoseAllRemoteDataSource {
  final PoseAllLocalDataSource _poseAllLocalDataSource = PoseAllLocalDataSource();
  final MaeumgagymPoseDataVersionLocalDataSource _poseDataVersionLocalDataSource = MaeumgagymPoseDataVersionLocalDataSource();

  Future<List<PoseDataModel>> getPoseDataList() async {
    final accessToken = await TokenSecureStorageDi.readLoginAccessToken();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken,
    };

    final String? lastUpdated =
        await _poseDataVersionLocalDataSource.getPoseDataVersion();

    Map<String, String> data = {
      "last_updated": lastUpdated ?? "2022-12-15T09:00",
    };

    try {
      final response = await dio.get(
        '/poses/all',
        data: data,
        options: Options(headers: headers),
      );

      debugPrint("poseAll -- ${response.statusCode}");

      if (response.statusCode! == 200) {
        await _poseAllLocalDataSource.setPoseDataList(
          PoseDataListModel.fromJson(response.data),
        );

        await _poseDataVersionLocalDataSource.setPoseDataVersion();

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
