import 'package:maeumgagym_flutter/domain/routines/entity/routine_pose_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_state_entity.dart';

class RoutineEntity {
  final int id;
  final bool isCompleted;
  final String routineName;
  final List<String> dayOfWeeks;
  final RoutineStatusEntity routineStatus;
  final List<RoutinePoseEntity> routinePoseList;

  const RoutineEntity({
    required this.id,
    required this.dayOfWeeks,
    required this.isCompleted,
    required this.routineName,
    required this.routineStatus,
    required this.routinePoseList,
  });
}
