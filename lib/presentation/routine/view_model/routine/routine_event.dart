import '../../../../data/routines/dto/request/add_routine_request.dart';

abstract class RoutineEvent {}

class GetRoutineDetailEvent extends RoutineEvent {
  final int routineId;
  final AddEditRoutineRequest? addRoutineRequest;

  GetRoutineDetailEvent({
    required this.routineId,
    this.addRoutineRequest,
  });
}