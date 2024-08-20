import 'package:maeumgagym_flutter/component/pose/domain/repository/pose_repository.dart';
import 'package:maeumgagym_flutter/component/pose/domain/entity/poses_entity.dart';

class GetPoseAllUseCase {
  final PoseRepository _poseRepository;

  GetPoseAllUseCase({
    required PoseRepository poseRepository,
  }) : _poseRepository = poseRepository;

  Future<PosesEntity> execute() => _poseRepository.getPoseAll();
}