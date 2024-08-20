import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/recommend/pose_recommend_event.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/recommend/pose_recommend_state.dart';

import '../../../domain/entity/pose_recommend_list_entity.dart';
import '../../../domain/use_case/get_pose_recommend_use_case.dart';

class PoseRecommendBloc extends Bloc<PoseRecommendEvent, PoseRecommendState<PoseRecommendListEntity>> {
  final GetPoseRecommendUseCase _getPoseRecommendUseCase;

  PoseRecommendBloc({
    required GetPoseRecommendUseCase getPoseRecommendUseCase,
  })  : _getPoseRecommendUseCase = getPoseRecommendUseCase,
        super(Empty()) {
    on<GetPoseRecommendEvent>(_getPoseAllHandler);
  }

  void _getPoseAllHandler(GetPoseRecommendEvent event, Emitter<PoseRecommendState<PoseRecommendListEntity>> emit) async {
    emit(Loading());

    try {
      PoseRecommendListEntity poseRecommendListEntity = await _getPoseRecommendUseCase.execute();
      emit(Loaded(data: poseRecommendListEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
