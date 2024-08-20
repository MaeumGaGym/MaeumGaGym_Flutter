import '../../../../domain/routines/entity/routine_state_entity.dart';

class RoutineStatusDto {
  final bool isShared;
  final bool isArchived;

  RoutineStatusDto({
    required this.isShared,
    required this.isArchived,
  });

  factory RoutineStatusDto.fromJson(Map<String, dynamic> json) {
    return RoutineStatusDto(
      isArchived: json['is_archived'],
      isShared: json['is_shared'],
    );
  }

  RoutineStatusEntity toEntity() {
    return RoutineStatusEntity(
      isShared: isShared,
      isArchived: isArchived,
    );
  }
}
