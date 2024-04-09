import 'package:maeum_ga_gym_flutter/pose/data/data_source/remote/pose_detail_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/pose/domain/model/pose_detail_model.dart';
import 'package:maeum_ga_gym_flutter/pose/domain/repository/pose_detail_repository.dart';

class PoseDetailRepositoryImpl implements PoseDetailRepository {
  final PoseDetailRemoteDataSource _dataSource = PoseDetailRemoteDataSource();

  @override
  Future<PoseDetailModel> getDetailData({required int id}) async {
    return await _dataSource.getDetailData(id: id);
  }
}
