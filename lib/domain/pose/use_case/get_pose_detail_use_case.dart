import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import '../repository/pose_detail_repository.dart';

class GetPoseDetailUseCase {
  final PoseDetailRepository _poseRepository;

  GetPoseDetailUseCase({
    required PoseDetailRepository poseRepository,
  }) : _poseRepository = poseRepository;

  Future<PoseDetailEntity> execute({required int poseId}) =>
      _poseRepository.getPoseDetail(poseId: poseId);
}