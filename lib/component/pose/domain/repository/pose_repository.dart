import 'package:maeumgagym_flutter/component/pose/domain/entity/poses_entity.dart';
import '../entity/pose_recommend_list_entity.dart';

abstract class PoseRepository {
  Future<PosesEntity> getPoseAll();

  Future<PoseRecommendListEntity> getPoseRecommend();
}