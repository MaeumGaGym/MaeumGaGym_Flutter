import 'package:maeumgagym_flutter/data/timer/dto/request/add_timer_request.dart';
import 'package:maeumgagym_flutter/domain/timer/repository/timer_repository.dart';

class AddTimerUseCase {
  final TimerRepository _timerRepository;

  AddTimerUseCase({required TimerRepository timerRepository})
      : _timerRepository = timerRepository;

  Future<void> execute({required AddTimerRequest addTimerRequest}) =>
      _timerRepository.addTimer(addTimerRequest: addTimerRequest);
}
