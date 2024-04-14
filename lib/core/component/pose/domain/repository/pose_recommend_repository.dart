import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';

abstract class PoseRecommendRepository {
  Future<PoseRecommendModel> getRecommendPose();
}
