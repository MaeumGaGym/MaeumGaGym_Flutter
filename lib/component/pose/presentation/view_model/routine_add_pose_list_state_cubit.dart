import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_model.dart';

import '../../../../data/routines/dto/request/exercise_info_request.dart';

class RoutineAddPoseListStateCubit extends Cubit<List<RoutineAddPoseListStateModel>> {
  RoutineAddPoseListStateCubit() : super(<RoutineAddPoseListStateModel>[]);

  void init({required List<RoutineAddPoseListStateModel> initList}){
    emit(initList);
  }

  /// 리스트에 포즈 추가
  void insert(RoutineAddPoseListStateModel item) {
    List<RoutineAddPoseListStateModel> data = state;

    data = [...data, item];
    emit(data);
  }

  /// 포즈 삭제
  void delete(int index) {
    List<RoutineAddPoseListStateModel> data = state;

    data = List.from(state)..removeAt(index);
    emit(data);
  }

  List<ExerciseInfoRequest> toRequest() {
    return state.map<ExerciseInfoRequest>(
          (e) => ExerciseInfoRequest(
            id: e.poseData.id,
            repetitions: int.parse(e.repetitionsController.text),
            sets: int.parse(e.setsController.text),
          ),
        ).toList();
  }
}
