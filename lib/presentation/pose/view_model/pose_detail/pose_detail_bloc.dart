import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_event.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_state.dart';

import '../../../../domain/pose/use_case/get_pose_detail_use_case.dart';

class PoseDetailBloc extends Bloc<PoseDetailEvent, PoseDetailState<PoseDetailEntity>> {
  final GetPoseDetailUseCase _getPoseDetailUseCase;

  PoseDetailBloc({required GetPoseDetailUseCase getPoseDetailUseCase})
      : _getPoseDetailUseCase = getPoseDetailUseCase,
        super(Empty()){
    on<GetPoseDetailEvent>(_getPoseDetailHandler);
  }

  void _getPoseDetailHandler(GetPoseDetailEvent event, Emitter<PoseDetailState<PoseDetailEntity>> emit) async {
    emit(Loading());

    try{
      PoseDetailEntity poseDetailEntity = await _getPoseDetailUseCase.execute(poseId: event.poseId);
      emit(Loaded(data: poseDetailEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}