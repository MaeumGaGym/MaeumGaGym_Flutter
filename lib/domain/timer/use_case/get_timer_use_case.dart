import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/repository/timer_repository.dart';

class GetTimersUseCase {
  final TimerRepository _timerRepository;

  GetTimersUseCase({required TimerRepository timerRepository})
      : _timerRepository = timerRepository;

  Future<TimersEntity> execute() => _timerRepository.getTimers();
}
