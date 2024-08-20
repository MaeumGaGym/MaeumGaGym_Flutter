import 'package:maeumgagym_flutter/data/routines/dto/response/routine_dto.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';

import '../../../../domain/routines/entity/routine_entity.dart';

class RoutinesDto {
  final List<RoutineDto> routines;

  const RoutinesDto({
    required this.routines,
  });

  factory RoutinesDto.fromJson(Map<String, dynamic> json) {
    return RoutinesDto(
      routines: json['routine_list'].map<RoutineDto>((data) => RoutineDto.fromJson(data)).toList(),
    );
  }

  RoutinesEntity toEntity() {
    return RoutinesEntity(
      routines: routines.map<RoutineEntity>((item) => item.toEntity()).toList(),
    );
  }
}

