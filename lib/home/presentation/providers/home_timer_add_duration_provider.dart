import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/timer/widget/home_timer_picker_widget.dart';

final homeTimerAddDurationProvider =
    StateNotifierProvider<DurationStateNotifier, DurationState>((ref) {
  return DurationStateNotifier();
});

class DurationStateNotifier extends StateNotifier<DurationState> {
  DurationStateNotifier()
      : super(DurationState(hour: 0, minute: 0, seconds: 0));

  Future<void> hourNotifier(int value) async {
    state.hour = value;
  }

  Future<void> minuteNotifier(int value) async {
    state.minute = value;
  }

  Future<void> secondsNotifier(int value) async {
    state.seconds = value;
  }
}

class DurationState {
  int hour;
  int minute;
  int seconds;

  DurationState({
    required this.hour,
    required this.minute,
    required this.seconds,
  });
}

String formatPickerNumber(int value) {
  return value >= 10 ? value.toString() : '0${value}';
}

String formatPickerTitle(TimerType type) {
  switch (type) {
    case TimerType.hour:
      return '시간';
    case TimerType.minute:
      return '분';
    case TimerType.seconds:
      return '초';
  }
}
