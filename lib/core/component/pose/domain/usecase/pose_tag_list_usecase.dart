import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_tag_list_repository.dart';

import '../model/pose_tag_list_model.dart';

class PoseTagListUseCase {
  final PoseTagListRepository _repository;

  PoseTagListUseCase({required PoseTagListRepository repository})
      : _repository = repository;

  Future<PoseTagListModel> getTagList({required String tag}) async {
    return await _repository.getTagList(tag: tag);
  }
}
