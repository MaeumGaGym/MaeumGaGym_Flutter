import 'package:maeum_ga_gym_flutter/home/data/data_source/remote/home_today_routines_remote_data_source.dart';
import 'package:maeum_ga_gym_flutter/home/domain/model/home_today_routines_model.dart';
import 'package:maeum_ga_gym_flutter/home/domain/repository/home_today_routines_repository.dart';

class HomeTodayRoutinesRepositoryImpl implements HomeTodayRoutinesRepository {
  final HomeTodayRoutinesRemoteDataSource _dataSource =
      HomeTodayRoutinesRemoteDataSource();

  @override
  Future<HomeTodayRoutinesModel> getTodayRoutines() async {
    return await _dataSource.getTodayRoutines();
  }
}
