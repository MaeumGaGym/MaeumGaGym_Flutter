import 'package:hive/hive.dart';
import 'package:maeumgagym_flutter/core/enum/timer_state_enum.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';

part 'timer_dto.g.dart';

@HiveType(typeId: 2)
class TimerDto {
  @HiveField(1)
  final int timerId;

  @HiveField(2)
  final int hours;

  @HiveField(3)
  final int minutes;

  @HiveField(4)
  final int seconds;

  TimerDto({
    required this.timerId,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  factory TimerDto.fromMap(Map<String, dynamic> map) {
    return TimerDto(
      timerId: map['timerId'],
      hours: map['hours'],
      minutes: map['minutes'],
      seconds: map['seconds'],
    );
  }

  TimerEntity toEntity(){
    return TimerEntity(
      timerId: timerId,
      timerState: TimerStateEnum.initial,
      currentTime: Duration(hours: hours, minutes: minutes, seconds: seconds),
      initialTime: Duration(hours: hours, minutes: minutes, seconds: seconds),
    );
  }
}
