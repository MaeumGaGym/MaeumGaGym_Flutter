import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/component/pose/data/dto/pose_recommend_list_dto.dart';
import 'package:maeumgagym_flutter/component/pose/data/dto/poses_dto.dart';

import '../../../../../core/token_secure_storage.dart';
import '../../../../../init/dio_init.dart';
import '../../../domain/entity/pose_recommend_list_entity.dart';
import '../../../domain/entity/poses_entity.dart';
import '../local/local_pose_all_data_source.dart';
import '../local/local_pose_version_data_source.dart';

class RemotePoseDataSource{
  final LocalPoseVersionDataSource _localPoseVersionDataSource;
  final LocalPoseAllDataSource _localPoseAllDataSource;

  RemotePoseDataSource({
    required LocalPoseVersionDataSource localPoseVersionDataSource,
    required LocalPoseAllDataSource localPoseAllDataSource,
  })  : _localPoseAllDataSource = localPoseAllDataSource,
        _localPoseVersionDataSource = localPoseVersionDataSource;

  Future<PosesEntity> getPoseAll() async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    final String? lastUpdated = await _localPoseVersionDataSource.getPoseVersion();

    Map<String, dynamic> headers = {'Authorization': accessToken};

    Map<String, String> data = {"last_updated": lastUpdated ?? "2022-12-15T09:00"};

    try {
      final response = await dio.get(
        '/poses/all',
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode! == 204) {
        PosesDto posesDto = await _localPoseAllDataSource.getPoseDataList();

        return posesDto.toEntity();
      } else {
        await _localPoseAllDataSource.setPoseDataList(PosesDto.fromJson(response.data));
        await _localPoseVersionDataSource.setPoseVersion();

        PosesDto posesDto = await _localPoseAllDataSource.getPoseDataList();
        return posesDto.toEntity();
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<PoseRecommendListEntity> getPoseRecommend() async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try{
      final response = await dio.get('/poses', options: Options(headers: headers));
      return PoseRecommendListDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }
}