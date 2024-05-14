import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_edit_routine_pose_model.dart';

final selfCareMyRoutineEditProvider = StateNotifierProvider.autoDispose<
    SelfCareMyRoutineEditStateNotifier, List<ExerciseInfoEditRoutinePoseModel>>(
  (ref) => SelfCareMyRoutineEditStateNotifier(),
);

class SelfCareMyRoutineEditStateNotifier
    extends StateNotifier<List<ExerciseInfoEditRoutinePoseModel>> {
  SelfCareMyRoutineEditStateNotifier() : super([]);

  /// 화면이 빌드되었을 때 서버에 저장되어있는 포즈를 리스트에 추가
  void init(List<ExerciseInfoEditRoutinePoseModel> itemList) {
    state = itemList;
  }

  /// 리스트에 포즈 추가
  void insert(ExerciseInfoEditRoutinePoseModel item) {
    state = [...state, item];
  }

  /// 포즈 삭제
  void delete(int index) {
    state = List.from(state)..removeAt(index);
  }
}