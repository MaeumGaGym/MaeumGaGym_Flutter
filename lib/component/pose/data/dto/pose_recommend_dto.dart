import '../../../../core/pose_model/pose_dto.dart';
import '../../../../core/pose_model/pose_entity.dart';
import '../../domain/entity/pose_recommend_entity.dart';

class PoseRecommendDto {
  final String category;
  final List<PoseDto> poses;

  const PoseRecommendDto({
    required this.category,
    required this.poses,
  });

  factory PoseRecommendDto.fromJson(Map<String, dynamic> response) {
    return PoseRecommendDto(
      category: response['category'],
      poses: response['poses']
          .map<PoseDto>((item) => PoseDto.fromJson(item))
          .toList(),
    );
  }

  PoseRecommendEntity toEntity() {
    return PoseRecommendEntity(
      category: category,
      poses: poses.map<PoseEntity>((item) => item.toEntity()).toList(),
    );
  }
}
