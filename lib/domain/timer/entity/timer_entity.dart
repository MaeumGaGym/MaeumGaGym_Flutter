import '../../../core/enum/timer_state_enum.dart';

class TimerEntity {
  final int timerId;
  final TimerStateEnum timerState;
  final Duration currentTime, initialTime;

  TimerEntity({
    required this.timerId,
    required this.timerState,
    required this.currentTime,
    required this.initialTime,
  });

  TimerEntity copyWith({
    int? timerId,
    TimerStateEnum? timerState,
    Duration? currentTime,
    Duration? initialTime,
  }) {
    return TimerEntity(
      timerId: timerId ?? this.timerId,
      timerState: timerState ?? this.timerState,
      currentTime: currentTime ?? this.currentTime,
      initialTime: initialTime ?? this.initialTime,
    );
  }
}
