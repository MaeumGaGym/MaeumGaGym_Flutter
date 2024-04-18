import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/repositoryImpl/pose_all_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/usecase/pose_all_usecase.dart';

final poseAllController =
    StateNotifierProvider<PoseTagListStateNotifier, List<PoseDataModel>>((ref) {
  return PoseTagListStateNotifier();
});

class PoseTagListStateNotifier extends StateNotifier<List<PoseDataModel>> {
  PoseTagListStateNotifier() : super([]);

  final PoseAllUseCase _useCase = PoseAllUseCase(
    repository: PoseAllRepositoryImpl(),
  );

  Future<void> getPoseDataList() async {
    state = await _useCase.getPoseDataList();
  }
}
