import '../../domain/model/local_timer_model.dart';
import '../../domain/repository/local_timer_repository.dart';
import '../data_source/local/local_timer_data_source.dart';

class DurationRepositoryImpl implements DurationRepository {
  final DurationLocalDataSource _dataSource = DurationLocalDataSource();

  @override
  Future<void> addTimers(
      {int timerId = 0,
      int hours = 0,
      int minutes = 0,
      int seconds = 0}) async {
    return await _dataSource.addTimer(
      timerId: timerId,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  @override
  Future<List<LocalTimerModel>> getTimers() async {
    return await _dataSource.getTimers();
  }

  @override
  Future<void> delTimers(int timerId) async {
    return await _dataSource.delTimer(timerId);
  }
}
