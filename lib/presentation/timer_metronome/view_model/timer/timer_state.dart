import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class TimerState<T> {
  BlocStateEnum timerState;

  T? valueOfNull;

  TimerState({
    required this.timerState,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends TimerState<T> {
  Empty() : super(timerState: BlocStateEnum.empty);
}

class Loading<T> extends TimerState<T> {
  Loading() : super(timerState: BlocStateEnum.loading);
}

class Loaded<T> extends TimerState<T> {
  T data;

  Loaded({required this.data})
      : super(timerState: BlocStateEnum.loaded, valueOfNull: data);
}
