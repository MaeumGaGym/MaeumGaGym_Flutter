import 'package:maeumgagym_flutter/data/routines/data_source/remote/remote_routines_data_source.dart';
import 'package:maeumgagym_flutter/data/routines/dto/request/add_routine_request.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routines_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/repository/routines_repository.dart';

class RoutinesRepositoryImpl implements RoutinesRepository {
  final RemoteRoutinesDataSource _remoteRoutinesDataSource;

  RoutinesRepositoryImpl({
    required RemoteRoutinesDataSource remoteRoutinesDataSource,
  }) : _remoteRoutinesDataSource = remoteRoutinesDataSource;

  @override
  Future<RoutinesEntity> getTodayRoutine() async {
    return await _remoteRoutinesDataSource.getTodayRoutines();
  }

  @override
  Future<RoutinesEntity> getRoutines({required int index}) async {
    return await _remoteRoutinesDataSource.getRoutines(index: index);
  }

  @override
  Future<void> addRoutine({required AddEditRoutineRequest addRoutineRequest}) async {
    return await _remoteRoutinesDataSource.addRoutine(addRoutineRequest: addRoutineRequest);
  }

  @override
  Future<void> editRoutine({required int routineId, required AddEditRoutineRequest addRoutineRequest}) async {
    return await _remoteRoutinesDataSource.editRoutine(routineId: routineId, addRoutineRequest: addRoutineRequest);
  }

  @override
  Future<void> delRoutine({required int routineId}) async {
    return await _remoteRoutinesDataSource.delRoutine(routineId: routineId);
  }

  @override
  Future<RoutineEntity> getRoutineDetail({required int routineId}) async {
    return await _remoteRoutinesDataSource.getRoutineDetail(routineId: routineId);
  }
}
