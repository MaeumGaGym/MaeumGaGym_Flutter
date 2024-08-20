import '../entity/routines_entity.dart';
import '../repository/routines_repository.dart';

class GetRoutinesUseCase {
  final RoutinesRepository _routinesRepository;

  GetRoutinesUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<RoutinesEntity> execute({required int index}) =>
      _routinesRepository.getRoutines(index: index);
}