import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

abstract class PoseAllRepository {
  Future<List<PoseDataModel>> getPoseDataList();
}
