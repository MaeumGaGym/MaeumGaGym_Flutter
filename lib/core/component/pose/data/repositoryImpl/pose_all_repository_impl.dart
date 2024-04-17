import 'package:maeum_ga_gym_flutter/core/component/pose/data/data_source/remote/pose_all_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/repository/pose_all_repository.dart';

class PoseAllRepositoryImpl implements PoseAllRepository {
  final PoseAllRemoteDataSource _dataSource = PoseAllRemoteDataSource();

  @override
  Future<List<PoseDataModel>> getPoseDataList() async {
    return await _dataSource.getPoseDataList();
  }
}
