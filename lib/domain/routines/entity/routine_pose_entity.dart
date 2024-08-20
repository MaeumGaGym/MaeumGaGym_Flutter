import '../../../core/pose_model/pose_entity.dart';

class RoutinePoseEntity {
  final PoseEntity pose;
  final int repetitions, sets;

  RoutinePoseEntity({
    required this.pose,
    required this.sets,
    required this.repetitions,
  });
}
