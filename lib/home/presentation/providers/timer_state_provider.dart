import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/models/timers.dart';

import '../../domain/model/local_timer_model.dart';

enum TimerState { initial, started, paused }

/// 화면에 보여지는 Timer의 index값을 관리하기 위한 provider
final selectedTimerProvider = StateProvider<int>((ref) => 0);

final timersProvider =
    StateNotifierProvider<TimersNotifier, List<Timers>>((ref) {
  return TimersNotifier();
});

class TimersNotifier extends StateNotifier<List<Timers>> {
  final List<StreamSubscription<int>?> _subscriptions = [null, null];

  // 이거 나중ㅇ ㅔ고쳐야됨

  TimersNotifier() : super([]);

  Future<void> initAddTimer(List<LocalTimerModel> list) async {
    List<Timers> movingList = [];
    Timers timers;
    int count = 0;

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

      movingList.add(timers);
      count = list[i].timerId;
    }

    for (int i = 0; i < count; i++) {
      _subscriptions.add(null);
    }

    state.clear();
    state.addAll(movingList);
  }

  Future<void> addTimer(
      {required int timerId,
      required int hours,
      required int minutes,
      required int seconds}) async {
    state.add(
      Timers(
        timerId: timerId,
        initialTime: Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ),
        currentTime: Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ),
      ),
    );
  }

  Future<void> delTimer({required int timerIndex}) async {
    int delIndex = 0;

    for (int i = 0; i < state.length; i++) {
      if (state[timerIndex].timerId == state[i].timerId) {
        delIndex = i;
      }
    }

    state.removeAt(delIndex);
  }

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
