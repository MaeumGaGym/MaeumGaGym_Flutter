import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/usecase/pose_recommend_usecase.dart';

final poseRecommendController =
    StateNotifierProvider<PoseRecommendStateNotifier, PoseRecommendListModel>(
        (ref) {
  return PoseRecommendStateNotifier();
});

class PoseRecommendStateNotifier extends StateNotifier<PoseRecommendListModel> {
  PoseRecommendStateNotifier()
      : super(PoseRecommendListModel(
          responses: [],
          statusCode: const AsyncData(500),
        ));

  final PoseRecommendUseCase _useCase = PoseRecommendUseCase();

  Future<void> getRecommendPose() async {
    state = PoseRecommendListModel(
      responses: state.responses,
      statusCode: const AsyncLoading(),
    );

    state = await _useCase.getRecommendPose();
  }
}
