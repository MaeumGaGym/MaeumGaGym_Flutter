import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_tag_list_model.dart';

abstract class PoseTagListRepository {
  Future<PoseTagListModel> getTagList({required String tag});
}
