import '../../../../core/pose_model/pose_entity.dart';

class PoseRecommendEntity {
  final String category;
  final List<PoseEntity> poses;

  const PoseRecommendEntity({
    required this.category,
    required this.poses,
  });
}
