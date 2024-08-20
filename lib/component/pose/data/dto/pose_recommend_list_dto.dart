import 'package:maeumgagym_flutter/component/pose/data/dto/pose_recommend_dto.dart';
import '../../domain/entity/pose_recommend_entity.dart';
import '../../domain/entity/pose_recommend_list_entity.dart';

class PoseRecommendListDto {
  List<PoseRecommendDto> responses;

  PoseRecommendListDto({
    required this.responses,
  });

  factory PoseRecommendListDto.fromJson(Map<String, dynamic> json) {
    return PoseRecommendListDto(
      responses: json["responses"]
          .map<PoseRecommendDto>((item) => PoseRecommendDto.fromJson(item))
          .toList(),
    );
  }

  PoseRecommendListEntity toEntity() {
    return PoseRecommendListEntity(
      responses: responses
          .map<PoseRecommendEntity>((item) => item.toEntity())
          .toList(),
    );
  }
}

