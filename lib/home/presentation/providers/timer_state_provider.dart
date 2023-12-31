import 'dart:async';
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
    Timers(currentTime: 5, initialTime: 5, timerId: 1),
    Timers(currentTime: 90, initialTime: 90, timerId: 2),
    Timers(currentTime: 60, initialTime: 60, timerId: 3),
  ]);

  void onTick(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId && timer.timerState == TimerState.started) {
        if (timer.currentTime != 0) {
          return timer.copyWith(currentTime: timer.currentTime - 1);
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

