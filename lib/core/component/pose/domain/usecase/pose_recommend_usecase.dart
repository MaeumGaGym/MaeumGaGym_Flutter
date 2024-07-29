import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_recommend_repository.dart';
import '../../../../di/init.dart';
import '../model/pose_recommend_model.dart';

class PoseRecommendUseCase {
  final PoseRecommendRepository _repository =
      locator<PoseRecommendRepository>();

  Future<PoseRecommendListModel> getRecommendPose() async {
    return await _repository.getRecommendPose();
  }
}
