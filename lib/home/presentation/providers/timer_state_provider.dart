import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/models/timers.dart';

import '../../domain/model/local_timer_model.dart';

final timersProvider =
    StateNotifierProvider<TimersNotifier, List<Timers>>((ref) {
  return TimersNotifier();
});

/// 화면에 보여지는 Timer의 index값을 관리하기 위한 provider
final selectedTimerProvider = StateProvider<int>((ref) => 0);

enum TimerState { initial, started, paused }

class TimersNotifier extends StateNotifier<List<Timers>> {
  final List<StreamSubscription<int>?> _subscriptions = [null, null];

  // 이거 나중ㅇ ㅔ고쳐야됨

  TimersNotifier()
      : super(
          [
            // Timers(
            //   currentTime: const Duration(seconds: 3),
            //   initialTime: const Duration(seconds: 3),
            //   timerId: 1,
            // ),
            // Timers(
            //   currentTime: const Duration(seconds: 30, minutes: 1),
            //   initialTime: const Duration(seconds: 30, minutes: 1),
            //   timerId: 2,
            // ),
            // Timers(
            //   currentTime: const Duration(hours: 2),
            //   initialTime: const Duration(hours: 2),
            //   timerId: 3,
            // ),
          ],
        );

  Future<void> initAddTimer(List<LocalTimerModel> list) async {
    List<Timers> movingList = [];
    Timers timers;

    int subScLength = 0;

    for (int i = 0; i < list.length; i++) {
      timers = Timers(
        timerId: list[i].timerId,
        initialTime: Duration(
          hours: list[i].hours,
          minutes: list[i].minutes,
          seconds: list[i].seconds,
        ),
        currentTime: Duration(
          hours: list[i].hours,
          minutes: list[i].minutes,
          seconds: list[i].seconds,
        ),
      );

      subScLength = list[i].timerId;
      movingList.add(timers);
    }

    for (int i = 0; i < subScLength; i++) {
      _subscriptions.add(null);
    }

    state.clear();
    state.addAll(movingList);
  }

  // Future<void> addTimer(Duration duration) async {
  //   _subscriptions.add(null);
  //   state.add(
  //     Timers(
  //       timerId: state[state.length - 1].timerId + 1,
  //       initialTime: duration,
  //       currentTime: duration,
  //     ),
  //   );
  // }

  void onTick(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId && timer.timerState == TimerState.started) {
        if (timer.currentTime > const Duration(milliseconds: 20)) {
          return timer.copyWith(
            currentTime: timer.currentTime - const Duration(milliseconds: 20),
          );
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
        _subscriptions[timerId - 1] =
            Stream.periodic(const Duration(milliseconds: 20), (x) => x)
                .listen((_) => onTick(timerId));
        return timer.copyWith(timerState: TimerState.started);
      }
      return timer;
    }).toList();
  }

  void onReset(int timerId) {
    state = state.map((timer) {
      if (timer.timerId == timerId) {
        return timer.copyWith(
          timerState: TimerState.initial,
          currentTime: timer.initialTime,
        );
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

  if (seconds > 0 || (seconds == 0 && hours == 0 && minutes == 0)) {
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

String formatFinishTime(Duration duration) {
  DateTime dateTime = DateTime.now();

  int dateTimeMill = dateTime.millisecondsSinceEpoch + duration.inMilliseconds;
  DateTime finishTime = DateTime.fromMillisecondsSinceEpoch(dateTimeMill);

  String hour =
      finishTime.hour > 12 ? '${finishTime.hour - 12}' : '${finishTime.hour}';
  String minute = '${finishTime.minute}'.padLeft(2, '0');

  return '${finishTime.hour >= 12 ? '오후' : '오전'} $hour:$minute';
}

String formatTimerListTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  if (duration.inHours > 0) {
    return '${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
  } else {
    return '${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
  }
}
