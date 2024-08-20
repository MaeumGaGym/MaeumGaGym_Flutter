import 'package:maeumgagym_flutter/domain/timer/repository/timer_repository.dart';

class DelTimerUseCase {
  final TimerRepository _timerRepository;

  DelTimerUseCase({required TimerRepository timerRepository})
      : _timerRepository = timerRepository;

  Future<void> execute({required int timerIndex}) =>
      _timerRepository.delTimer(timerIndex: timerIndex);
}
