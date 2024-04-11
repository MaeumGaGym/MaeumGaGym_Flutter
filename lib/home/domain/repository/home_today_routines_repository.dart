import 'package:maeum_ga_gym_flutter/home/domain/model/home_today_routines_model.dart';

abstract class HomeTodayRoutinesRepository {
  Future<HomeTodayRoutinesModel> getTodayRoutines();
}
