import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_edit_routine_pose_model.dart';

final selfCareMyRoutineEditProvider = StateNotifierProvider.autoDispose<
    SelfCareMyRoutineEditStateNotifier, List<ExerciseInfoEditRoutinePoseModel>>(
  (ref) => SelfCareMyRoutineEditStateNotifier(),
);

class SelfCareMyRoutineEditStateNotifier
    extends StateNotifier<List<ExerciseInfoEditRoutinePoseModel>> {
  SelfCareMyRoutineEditStateNotifier() : super([]);

  void init(List<ExerciseInfoEditRoutinePoseModel> itemList) {
    state = itemList;
  }

  void insert(ExerciseInfoEditRoutinePoseModel item) {
    state = [...state, item];
  }

  void delete(int index) {
    state = List.from(state)..removeAt(index);
  }
}