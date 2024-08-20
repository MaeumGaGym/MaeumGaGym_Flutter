import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';

class PoseDetailDto {
  final bool needMachine;
  final String simpleName, exactName, thumbnail;
  final List<String> category, simplePart, exactPart;
  final List<String> startPose, exerciseWay, breatheWay, caution;

  PoseDetailDto({
    required this.needMachine,
    required this.simpleName,
    required this.exactName,
    required this.thumbnail,
    required this.category,
    required this.simplePart,
    required this.exactPart,
    required this.startPose,
    required this.exerciseWay,
    required this.breatheWay,
    required this.caution,
  });

  factory PoseDetailDto.fromJson(Map<String, dynamic> json) {
    return PoseDetailDto(
      needMachine: json['need_machine'],
      simpleName: json['simple_name'],
      exactName: json['exact_name'],
      thumbnail: json['thumbnail'],
      category: List<String>.from(json['category']),
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      startPose: List<String>.from(json['start_pose']),
      exerciseWay: List<String>.from(json['exercise_way']),
      breatheWay: List<String>.from(json['breathe_way']),
      caution: List<String>.from(json['caution']),
    );
  }

  PoseDetailEntity toEntity() {
    return PoseDetailEntity(
      needMachine: needMachine,
      simpleName: simpleName,
      exactName: exactName,
      thumbnail: thumbnail,
      category: category,
      simplePart: simplePart,
      exactPart: exactPart,
      startPose: startPose,
      exerciseWay: exerciseWay,
      breatheWay: breatheWay,
      caution: caution,
    );
  }
}