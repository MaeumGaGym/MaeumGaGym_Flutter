import '../entity/pose_detail_entity.dart';

abstract class PoseDetailRepository {
  Future<PoseDetailEntity> getPoseDetail({required int poseId});
}