import 'package:maeum_ga_gym_flutter/self_care/data/date_source/remote/waka_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/waka/waka_response_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/repository/waka_repository.dart';

class WakaRepositoryImpl implements WakaRepository {
  final WakaRemoteDataSource _remoteDataSource = WakaRemoteDataSource();

  @override
  Future<WakaResponseModel> totalWaka({
    required String accessToken,
  }) async {
    return await _remoteDataSource.totalWaka(
      accessToken: accessToken,
    );
  }

  @override
  Future<WakaResponseModel> dailyWaka({
    required String accessToken,
  }) async {
    return await _remoteDataSource.totalWaka(
      accessToken: accessToken,
    );
  }
}
