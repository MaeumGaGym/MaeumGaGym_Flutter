import 'package:maeumgagym_flutter/core/pose_model/pose_dto.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';
import 'package:maeumgagym_flutter/component/pose/domain/entity/poses_entity.dart';

class PosesDto {
  List<PoseDto> poses;

  PosesDto({
    required this.poses,
  });

  factory PosesDto.fromJson(Map<String, dynamic> json) {
    return PosesDto(
      poses: json['responses']
          .map<PoseDto>((item) => PoseDto.fromJson(item))
          .toList(),
    );
  }

  PosesEntity toEntity() {
    return PosesEntity(
      poses: poses.map<PoseEntity>((item) => item.toEntity()).toList(),
    );
  }
}