import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_all_repository.dart';

class PoseAllUseCase {
  final PoseAllRepository _repository;

  PoseAllUseCase({required PoseAllRepository repository})
      : _repository = repository;

  Future<List<PoseDataModel>> getPoseDataList() async {
    return await _repository.getPoseDataList();
  }
}
