import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/repository/routines_repository.dart';

class GetTodayRoutineUseCase {
  final RoutinesRepository _routinesRepository;

  GetTodayRoutineUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<RoutinesEntity> execute() => _routinesRepository.getTodayRoutine();
}