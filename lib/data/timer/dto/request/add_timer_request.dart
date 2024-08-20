import 'package:maeumgagym_flutter/data/timer/dto/response/timer_dto.dart';

class AddTimerRequest {
  final int timerId, hours, minutes, seconds;

  AddTimerRequest({
    required this.timerId,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  TimerDto toDto(){
    return TimerDto(
      timerId: timerId,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }
}