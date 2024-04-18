import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/pose/data/repositoryImpl/pose_detail_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/pose/domain/model/pose_detail_model.dart';
import 'package:maeum_ga_gym_flutter/pose/domain/usecase/pose_detail_usecase.dart';

final poseDetailController =
    StateNotifierProvider<PoseTagListStateNotifier, PoseDetailModel>((ref) {
  return PoseTagListStateNotifier();
});

class PoseTagListStateNotifier extends StateNotifier<PoseDetailModel> {
  PoseTagListStateNotifier()
      : super(
          PoseDetailModel(
            simpleName: null,
            exactName: null,
            thumbnail: null,
            video: null,
            simplePart: null,
            exactPart: null,
            startPose: null,
            exerciseWay: null,
            breatheWay: null,
            caution: null,
            statusCode: const AsyncLoading(),
          ),
        );

  final PoseDetailUseCase _useCase =
      PoseDetailUseCase(repository: PoseDetailRepositoryImpl());

  Future<void> getDetailData({required int id}) async {
    state = state.copyWith(statusCode: const AsyncLoading());

    state = await _useCase.getDetailData(id: id);
  }

  Future<void> setDetailData() async {
    state = state.copyWith(statusCode: const AsyncLoading());
  }
}
