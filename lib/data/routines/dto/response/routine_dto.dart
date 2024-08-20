import 'package:maeumgagym_flutter/data/routines/dto/response/routine_pose_dto.dart';
import 'package:maeumgagym_flutter/data/routines/dto/response/routine_status_dto.dart';

import '../../../../domain/routines/entity/routine_entity.dart';
import '../../../../domain/routines/entity/routine_pose_entity.dart';

class RoutineDto {
  final int id;
  final bool isCompleted;
  final String routineName;
  final List<String> dayOfWeeks;
  final RoutineStatusDto routineStatus;
  final List<RoutinePoseDto> routinePoseList;

  const RoutineDto({
    required this.id,
    required this.dayOfWeeks,
    required this.isCompleted,
    required this.routineName,
    required this.routineStatus,
    required this.routinePoseList,
  });

  factory RoutineDto.fromJson(Map<String, dynamic> json) {
    return RoutineDto(
      id: json['id'],
      routineName: json['routine_name'],
      routinePoseList: json['exercise_info_response_list'].map<RoutinePoseDto>((item) => RoutinePoseDto.fromJson(item)).toList(),
      dayOfWeeks: List<String>.from(json['day_of_weeks']),
      routineStatus: RoutineStatusDto.fromJson(json['routine_status']),
      isCompleted: json['is_completed'],
    );
  }

  RoutineEntity toEntity() {
    return RoutineEntity(
      id: id,
      dayOfWeeks: dayOfWeeks,
      isCompleted: isCompleted,
      routineName: routineName,
      routineStatus: routineStatus.toEntity(),
      routinePoseList: routinePoseList
          .map<RoutinePoseEntity>((item) => item.toEntity())
          .toList(),
    );
  }
}