import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/repositoryImpl/pose_recommend_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/usecase/pose_recommend_usecase.dart';

final poseRecommendController =
    StateNotifierProvider<PoseRecommendStateNotifier, PoseRecommendModel>(
        (ref) {
  return PoseRecommendStateNotifier();
});

class PoseRecommendStateNotifier extends StateNotifier<PoseRecommendModel> {
  PoseRecommendStateNotifier()
      : super(PoseRecommendModel(
          poses: null,
          statusCode: const AsyncData(500),
        ));

  final PoseRecommendUseCase _useCase = PoseRecommendUseCase(
    repository: PoseRecommendRepositoryImpl(),
  );

  Future<void> getRecommendPose() async {
    state = PoseRecommendModel(
      poses: state.poses,
      statusCode: const AsyncLoading(),
    );

    state = await _useCase.getRecommendPose();
  }
}
