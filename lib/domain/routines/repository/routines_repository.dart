import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';

abstract class RoutinesRepository {
  Future<RoutinesEntity> getTodayRoutine();

  Future<RoutinesEntity> getRoutines({required int index});

  Future<void> addRoutine({required AddEditRoutineRequest addRoutineRequest});

  Future<void> editRoutine({required int routineId, required AddEditRoutineRequest addRoutineRequest});

  Future<void> delRoutine({required int routineId});

  Future<RoutineEntity> getRoutineDetail({required int routineId});
}
