import '../repository/routines_repository.dart';

class DelRoutineUseCase {
  final RoutinesRepository _routinesRepository;

  DelRoutineUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<void> execute({required int routineId}) =>
      _routinesRepository.delRoutine(routineId: routineId);
}