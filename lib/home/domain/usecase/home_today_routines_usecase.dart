import 'package:maeum_ga_gym_flutter/home/domain/repository/home_today_routines_repository.dart';

import '../model/home_today_routines_model.dart';

class HomeTodayRoutinesUseCase {
  final HomeTodayRoutinesRepository _repository;

  HomeTodayRoutinesUseCase({required HomeTodayRoutinesRepository repository})
      : _repository = repository;

  Future<HomeTodayRoutinesModel> getTodayRoutines() async {
    return await _repository.getTodayRoutines();
  }
}
