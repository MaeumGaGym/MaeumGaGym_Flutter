import 'package:dio/dio.dart';
import 'package:maeumgagym_flutter/core/token_secure_storage.dart';
import 'package:maeumgagym_flutter/data/pose/dto/pose_detail_dto.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import '../../../../init/dio_init.dart';

class RemotePoseDetailDataSource {


  Future<PoseDetailEntity> getPoseDetail({required int poseId}) async {
    final accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> headers = {'Authorization': accessToken};

    try{
      final response = await dio.get("/poses/$poseId", options: Options(headers: headers));
      return PoseDetailDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception(err);
    }
  }
}