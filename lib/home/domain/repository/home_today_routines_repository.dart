import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/domain/model/home_today_routines_model.dart';

abstract class HomeTodayRoutinesRepository {
  Future<HomeTodayRoutineListModel> getTodayRoutines();

  Future<AsyncValue<int>> completeTodayRoutines(int id);

  Future<AsyncValue<int>> incompleteTodayRoutines(int id);
}
