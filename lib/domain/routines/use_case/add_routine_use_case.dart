import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';

import '../repository/routines_repository.dart';

class AddRoutineUseCase {
  final RoutinesRepository _routinesRepository;

  AddRoutineUseCase({
    required RoutinesRepository routinesRepository,
  }) : _routinesRepository = routinesRepository;

  Future<void> execute({required AddEditRoutineRequest addRoutineRequest}) =>
      _routinesRepository.addRoutine(addRoutineRequest: addRoutineRequest);
}