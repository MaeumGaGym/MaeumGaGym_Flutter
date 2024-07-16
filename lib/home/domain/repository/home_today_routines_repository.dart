import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/model/routine/maeumgagym_routine_list_model.dart';

abstract class HomeTodayRoutinesRepository {
  Future<MaeumgagymRoutineListModel> getTodayRoutines();

  Future<AsyncValue<int>> completeTodayRoutines(int id);

  Future<AsyncValue<int>> incompleteTodayRoutines(int id);
}
