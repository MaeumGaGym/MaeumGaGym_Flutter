import '../../../../core/pose_model/pose_dto.dart';
import '../../../../domain/routines/entity/routine_pose_entity.dart';

class RoutinePoseDto {
  final PoseDto pose;
  final int repetitions, sets;

  RoutinePoseDto({
    required this.pose,
    required this.sets,
    required this.repetitions,
  });

  factory RoutinePoseDto.fromJson(Map<String, dynamic> json) {
    return RoutinePoseDto(
      pose: PoseDto.fromJson(json['pose']),
      repetitions: json['repetitions'],
      sets: json['sets'],
    );
  }

  RoutinePoseEntity toEntity() {
    return RoutinePoseEntity(
      pose: pose.toEntity(),
      sets: sets,
      repetitions: repetitions,
    );
  }
}