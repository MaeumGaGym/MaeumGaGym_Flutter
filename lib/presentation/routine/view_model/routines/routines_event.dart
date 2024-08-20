import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';

abstract class RoutinesEvent {}

class GetRoutinesInitEvent extends RoutinesEvent {}

class GetRoutinesEvent extends RoutinesEvent {
  final int index;

  GetRoutinesEvent({required this.index});
}

class AddRoutineEvent extends RoutinesEvent {
  final AddEditRoutineRequest addRoutineRequest;

  AddRoutineEvent({required this.addRoutineRequest});
}

class EditRoutineEvent extends RoutinesEvent {
  final int routineId;
  final AddEditRoutineRequest addRoutineRequest;

  EditRoutineEvent({
    required this.routineId,
    required this.addRoutineRequest,
  });
}

class DelRoutineEvent extends RoutinesEvent {
  final int routineId;

  DelRoutineEvent({required this.routineId});
}