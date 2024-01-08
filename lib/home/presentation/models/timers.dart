import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/timer_state_provider.dart';

part 'timers.freezed.dart';
part 'timers.g.dart';

@freezed
class Timers with _$Timers {
  factory Timers({
    required int timerId,
    required int initialTime,
    @Default(TimerState.initial) TimerState timerState,
    required int currentTime,
  }) = _Timers;

  factory Timers.fromJson(Map<String, dynamic> json) => _$TimersFromJson(json);
}
