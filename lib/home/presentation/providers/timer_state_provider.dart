import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/models/timers.dart';

final timerStateProvider = StateProvider<bool>((ref) => true);
// true => 타이머 , false => 메트로놈

final timersProvider =
    StateNotifierProvider<TimersNotifier, List<Timers>>((ref) {
  return TimersNotifier();
});

enum TimerState { initial, started, paused }

class TimersNotifier extends StateNotifier<List<Timers>> {
  final List<StreamSubscription<int>?> _subscriptions = [null, null, null];
  // 이거 나중ㅇ ㅔ고쳐야됨

  TimersNotifier()
      : super([
    Timers(currentTime: const Duration(seconds: 3), initialTime: const Duration(seconds: 3), timerId: 1),
    Timers(currentTime: const Duration(seconds: 90), initialTime: const Duration(seconds: 90), timerId: 2),
    Timers(currentTime: const Duration(seconds: 86400), initialTime: const Duration(seconds: 86400), timerId: 3),
  ]);

  void onTick(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId && timer.timerState == TimerState.started) {
        if (timer.currentTime != const Duration(seconds: 0)) {
          return timer.copyWith(currentTime: timer.currentTime - const Duration(seconds: 1));
        } else {
          _subscriptions[timerId - 1]?.cancel();
          return timer.copyWith(
            currentTime: timer.initialTime,
            timerState: TimerState.initial,
          );
        }
      }
      return timer;
    }).toList();
  }

  void onStarted(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId && timer.timerState != TimerState.started) {
        _subscriptions[timerId - 1]?.cancel();
        _subscriptions[timerId - 1] = Stream.periodic(const Duration(seconds: 1), (x) => x)
            .listen((_) => onTick(timerId));
        return timer.copyWith(timerState: TimerState.started);
      }
      return timer;
    }).toList();
  }

  void onPaused(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId && timer.timerState == TimerState.started) {
        _subscriptions[timerId - 1]?.cancel();
        return timer.copyWith(timerState: TimerState.paused);
      }
      return timer;
    }).toList();
  }
}

String formatInitialTime(Duration duration) {
  int seconds = duration.inSeconds % 60;
  int minutes = (duration.inSeconds ~/ 60) % 60;
  int hours = duration.inHours;

  String formattedDuration = '';

  if (hours > 0) {
    formattedDuration += '$hours시간 ';
  }

  if (minutes > 0) {
    formattedDuration += '$minutes분 ';
  }

  if (seconds > 0) {
    formattedDuration += '$seconds초';
  }

  return formattedDuration.trim();
}

String formatCurrentTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  if (duration.inHours > 0) {
    return '${twoDigits(duration.inHours)} : ${twoDigits(duration.inMinutes.remainder(60))} : ${twoDigits(duration.inSeconds.remainder(60))}';
  } else {
    return '${twoDigits(duration.inMinutes.remainder(60))} : ${twoDigits(duration.inSeconds.remainder(60))}';
  }
}

String formatTimerListTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  if (duration.inHours > 0) {
    return '${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
  } else {
    return '${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
  }
}
