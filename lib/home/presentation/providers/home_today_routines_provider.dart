import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/data/repositoryImpl/home_today_routines_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/home/domain/model/home_today_routines_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/usecase/home_today_routines_usecase.dart';

final homeTodayRoutineController = StateNotifierProvider<
    HomeTodayRoutineStateNotifier, HomeTodayRoutinesModel>((ref) {
  return HomeTodayRoutineStateNotifier();
});

class HomeTodayRoutineStateNotifier
    extends StateNotifier<HomeTodayRoutinesModel> {
  HomeTodayRoutineStateNotifier()
      : super(
          HomeTodayRoutinesModel(
            id: null,
            routineName: null,
            exerciseInfoResponseList: null,
            dayOfWeeks: null,
            routineStatus: null,
            isCompleted: null,
            statusCode: const AsyncData(500),
          ),
        );

  final HomeTodayRoutinesUseCase _useCase = HomeTodayRoutinesUseCase(
    repository: HomeTodayRoutinesRepositoryImpl(),
  );

  Future<void> getTodayRoutines() async {
    state = state.copyWith(statusCode: const AsyncLoading());
    state = await _useCase.getTodayRoutines();
  }
}
