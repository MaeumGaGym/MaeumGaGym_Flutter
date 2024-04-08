import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/data/repositoryImpl/pose_tag_list_repository_impl.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_tag_list_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/usecase/pose_tag_list_usecase.dart';

final poseTagListController =
    StateNotifierProvider<PoseTagListStateNotifier, PoseTagListModel>((ref) {
  return PoseTagListStateNotifier();
});

class PoseTagListStateNotifier extends StateNotifier<PoseTagListModel> {
  PoseTagListStateNotifier()
      : super(
          PoseTagListModel(
            responses: [],
            statusCode: const AsyncData(500),
          ),
        );

  final PoseTagListUseCase _useCase = PoseTagListUseCase(
    repository: PoseTagListRepositoryImpl(),
  );

  Future<void> getTagList({required String tag}) async {
    state = state.copyWith(statusCode: const AsyncLoading());

    state = await _useCase.getTagList(tag: tag);
  }
}
