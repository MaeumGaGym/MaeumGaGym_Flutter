import 'package:maeum_ga_gym_flutter/pose/domain/repository/pose_detail_repository.dart';

import '../model/pose_detail_model.dart';

class PoseDetailUseCase {
  final PoseDetailRepository _repository;

  PoseDetailUseCase({required PoseDetailRepository repository})
      : _repository = repository;

  Future<PoseDetailModel> getDetailData({required int id}) async {
    return await _repository.getDetailData(id: id);
  }
}
