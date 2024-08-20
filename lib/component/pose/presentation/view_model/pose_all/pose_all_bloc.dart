import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/pose_all/pose_all_event.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/pose_all/pose_all_state.dart';

import '../../../domain/use_case/get_pose_all_use_case.dart';
import '../../../domain/entity/poses_entity.dart';


class PoseAllBloc extends Bloc<PoseAllEvent, PoseAllState<PosesEntity>> {
  final GetPoseAllUseCase _getPoseAllUseCase;

  PoseAllBloc({
    required GetPoseAllUseCase getPoseAllUseCase,
  })  : _getPoseAllUseCase = getPoseAllUseCase,
        super(Empty()) {
    on<GetPoseAllEvent>(_getPoseAllHandler);
  }

  void _getPoseAllHandler(GetPoseAllEvent event, Emitter<PoseAllState<PosesEntity>> emit) async {
    emit(Loading());

    try{
      PosesEntity posesEntity = await _getPoseAllUseCase.execute();
      emit(Loaded(data: posesEntity));
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}