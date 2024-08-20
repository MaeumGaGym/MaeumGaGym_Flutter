import 'package:maeumgagym_flutter/data/timer/data_source/local/local_timer_data_source.dart';
import 'package:maeumgagym_flutter/data/timer/dto/request/add_timer_request.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/repository/timer_repository.dart';

class TimerRepositoryImpl implements TimerRepository {
  final LocalTimerDataSource _localTimerDataSource;

  TimerRepositoryImpl({
    required LocalTimerDataSource localTimerDataSource,
  }) : _localTimerDataSource = localTimerDataSource;

  @override
  Future<TimersEntity> getTimers() async {
    return await _localTimerDataSource.getTimers();
  }

  @override
  Future<void> addTimer({required AddTimerRequest addTimerRequest}) async {
    return await _localTimerDataSource.addTimer(addTimerRequest: addTimerRequest);
  }

  @override
  Future<void> delTimer({required int timerIndex}) async {
    return await _localTimerDataSource.delTimer(timerIndex: timerIndex);
  }
}