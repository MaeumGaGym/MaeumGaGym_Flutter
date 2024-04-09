import 'package:maeum_ga_gym_flutter/pose/domain/model/pose_detail_model.dart';

abstract class PoseDetailRepository {
  Future<PoseDetailModel> getDetailData({required int id});
}
