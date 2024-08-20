import 'package:maeumgagym_flutter/data/pose/data_source/remote/remote_pose_detail_data_souce.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/domain/pose/repository/pose_detail_repository.dart';

class PoseDetailRepositoryImpl implements PoseDetailRepository {
  final RemotePoseDetailDataSource _remotePoseDetailDataSource;

  PoseDetailRepositoryImpl({
    required RemotePoseDetailDataSource remotePoseDetailDataSource,
  }) : _remotePoseDetailDataSource = remotePoseDetailDataSource;

  @override
  Future<PoseDetailEntity> getPoseDetail({required int poseId}) async {
    return await _remotePoseDetailDataSource.getPoseDetail(poseId: poseId);
  }
}