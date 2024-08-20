import 'package:maeumgagym_flutter/component/pose/domain/repository/pose_repository.dart';
import '../entity/pose_recommend_list_entity.dart';

class GetPoseRecommendUseCase {
  final PoseRepository _poseRepository;

  GetPoseRecommendUseCase({required PoseRepository poseRepository})
      : _poseRepository = poseRepository;

  Future<PoseRecommendListEntity> execute() => _poseRepository.getPoseRecommend();
}