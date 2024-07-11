import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/domain/repository/home_today_routines_repository.dart';

import '../../../core/di/init.dart';
import '../../../core/model/routine/maeumgagym_routine_list_model.dart';

class HomeTodayRoutinesUseCase {
  final HomeTodayRoutinesRepository _repository =
      locator<HomeTodayRoutinesRepository>();

  Future<MaeumgagymRoutineListModel> getTodayRoutines() async {
    return await _repository.getTodayRoutines();
  }

  Future<AsyncValue<int>> completeTodayRoutines(int id) async {
    return await _repository.completeTodayRoutines(id);
  }

  Future<AsyncValue<int>> incompleteTodayRoutines(int id) async {
    return await _repository.incompleteTodayRoutines(id);
  }
}
