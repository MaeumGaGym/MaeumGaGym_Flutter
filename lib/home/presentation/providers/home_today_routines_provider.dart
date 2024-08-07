import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/model/routine/maeumgagym_routine_list_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/usecase/home_today_routines_usecase.dart';

final homeTodayRoutineController = StateNotifierProvider<
    HomeTodayRoutineStateNotifier, MaeumgagymRoutineListModel>((ref) {
  return HomeTodayRoutineStateNotifier();
});

class HomeTodayRoutineStateNotifier
    extends StateNotifier<MaeumgagymRoutineListModel> {
  HomeTodayRoutineStateNotifier()
      : super(MaeumgagymRoutineListModel(
          routineList: [],
          statusCode: const AsyncData(500),
        ));

  final HomeTodayRoutinesUseCase _useCase = HomeTodayRoutinesUseCase();

  Future<void> getTodayRoutines() async {
    state = state.copyWith(statusCode: const AsyncLoading());
    
    state = await _useCase.getTodayRoutines();
  }

  Future<void> completeTodayRoutines(int id) async {
    state = state.copyWith(statusCode: const AsyncLoading());

    AsyncValue<int> statusCode = await _useCase.completeTodayRoutines(id);

    state = state.copyWith(statusCode: statusCode);
  }

  Future<void> incompleteTodayRoutines(int id) async {
    state = state.copyWith(statusCode: const AsyncLoading());

    AsyncValue<int> statusCode = await _useCase.incompleteTodayRoutines(id);

    state = state.copyWith(statusCode: statusCode);
  }
}
