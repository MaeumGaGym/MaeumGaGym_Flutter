import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/remote/pose_tag_list_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_tag_list_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_tag_list_repository.dart';

class PoseTagListRepositoryImpl implements PoseTagListRepository {
  final PoseTagListRemoteDataSource _dataSource = PoseTagListRemoteDataSource();

  @override
  Future<PoseTagListModel> getTagList({required String tag}) async {
    return await _dataSource.getTagList(tag: tag);
  }
}
