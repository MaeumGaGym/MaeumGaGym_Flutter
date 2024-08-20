import 'package:maeumgagym_flutter/data/timer/dto/request/add_timer_request.dart';

import '../entity/timers_entity.dart';

abstract class TimerRepository {
  Future<TimersEntity> getTimers();

  Future<void> addTimer({required AddTimerRequest addTimerRequest});

  Future<void> delTimer({required int timerIndex});
}