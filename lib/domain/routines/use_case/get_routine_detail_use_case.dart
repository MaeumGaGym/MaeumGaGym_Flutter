import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';

import '../repository/routines_repository.dart';

class GetRoutineDetailUseCase {
  final RoutinesRepository _routinesRepository;

  GetRoutineDetailUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<RoutineEntity> execute({required int routineId}) =>
      _routinesRepository.getRoutineDetail(routineId: routineId);
}