import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/remote/pose_recommend_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_recommend_repository.dart';

class PoseRecommendRepositoryImpl implements PoseRecommendRepository {
  final PoseRecommendRemoteDataSource _dataSource =
      PoseRecommendRemoteDataSource();

  @override
  Future<PoseRecommendListModel> getRecommendPose() async {
    return await _dataSource.getRecommendPose();
  }
}
