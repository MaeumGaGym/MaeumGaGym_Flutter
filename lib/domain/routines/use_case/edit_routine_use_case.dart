import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';

import '../repository/routines_repository.dart';

class EditRoutineUseCase {
  final RoutinesRepository _routinesRepository;

  EditRoutineUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<void> execute({required int routineId, required AddEditRoutineRequest addRoutineRequest}) =>
      _routinesRepository.editRoutine(routineId: routineId, addRoutineRequest: addRoutineRequest);
}