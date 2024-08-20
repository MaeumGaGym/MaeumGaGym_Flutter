import 'package:maeumgagym_flutter/component/pose/data/data_source/remote/remote_pose_data_source.dart';
import 'package:maeumgagym_flutter/component/pose/domain/repository/pose_repository.dart';
import '../../domain/entity/pose_recommend_list_entity.dart';
import '../../domain/entity/poses_entity.dart';

class PoseRepositoryImpl implements PoseRepository {
  final RemotePoseDataSource _remotePoseDataSource;

  PoseRepositoryImpl({required RemotePoseDataSource remotePoseDataSource})
      : _remotePoseDataSource = remotePoseDataSource;

  @override
  Future<PosesEntity> getPoseAll() async {
    return await _remotePoseDataSource.getPoseAll();
  }

  @override
  Future<PoseRecommendListEntity> getPoseRecommend() async {
    return await _remotePoseDataSource.getPoseRecommend();
  }
}
