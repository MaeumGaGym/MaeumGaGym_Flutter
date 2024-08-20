import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/data/timer/dto/request/add_timer_request.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timer_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/domain/timer/use_case/get_timer_use_case.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';

import '../../../../core/enum/timer_state_enum.dart';
import '../../../../core/timer_sound.dart';
import '../../../../domain/timer/use_case/add_timer_use_case.dart';
import '../../../../domain/timer/use_case/del_timer_use_case.dart';

class TimerStateCubit extends Cubit<TimerState<TimersEntity>> {
  final GetTimersUseCase _getTimerUseCase;
  final AddTimerUseCase _addTimerUseCase;
  final DelTimerUseCase _delTimerUseCase;

  TimerStateCubit({
    required GetTimersUseCase getTimerUseCase,
    required AddTimerUseCase addTimerUseCase,
    required DelTimerUseCase delTimerUseCase,
  })  : _getTimerUseCase = getTimerUseCase,
        _addTimerUseCase = addTimerUseCase,
        _delTimerUseCase = delTimerUseCase,
        super(Empty());

  final Duration _onTickUnit = const Duration(milliseconds: 20);
  final Map<int, StreamSubscription<int>> _subscriptions = <int, StreamSubscription<int>>{};

  void getTimers() async {
    emit(Loading());

    TimersEntity timersEntity = await _getTimerUseCase.execute();
    emit(Loaded(data: timersEntity));
  }

  void addTimer({
    required int hours,
    required int minutes,
    required int seconds,
  }) async {
    TimersEntity entity = state.value;
    int timerId = entity.timers.isEmpty ? 0 : entity.timers[entity.timers
        .length - 1].timerId + 1;

    await _addTimerUseCase.execute(
      addTimerRequest: AddTimerRequest(
        timerId: timerId,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      ),
    );

    TimersEntity timersEntity = state.value;
    timersEntity.timers.add(
      TimerEntity(
        timerId: timerId,
        timerState: TimerStateEnum.initial,
        currentTime: Duration(hours: hours, minutes: minutes, seconds: seconds),
        initialTime: Duration(hours: hours, minutes: minutes, seconds: seconds),
      ),
    );
    emit(Loaded(data: timersEntity));
  }

  void delTimer({required int timerIndex}) async {
    await _delTimerUseCase.execute(timerIndex: timerIndex);

    TimersEntity timersEntity = state.value;
    timersEntity.timers.removeAt(timerIndex);
    emit(Loaded(data: timersEntity));
  }

  /// Timer가 돌아가는 tick 함수
  void _onTick(int timerId) {
    TimersEntity timers = state.value;

    timers = TimersEntity(
      timers: timers.timers.map(
        (timer) {
          if (timer.timerId == timerId &&
              timer.timerState == TimerStateEnum.started) {
            if (timer.currentTime > _onTickUnit) {
              return timer.copyWith(
                currentTime: timer.currentTime - _onTickUnit,
              );
            } else {
              TimerSound.timerEnd();
              _subscriptions[timerId]?.cancel();

              return timer.copyWith(
                currentTime: timer.initialTime,
                timerState: TimerStateEnum.initial,
              );
            }
          }
          return timer;
        },
      ).toList(),
    );

    emit(Loaded(data: timers));
  }

  void startTimer({required int timerId}) {
    TimersEntity timers = state.value;

    timers = TimersEntity(
      timers: timers.timers.map(
        (timer) {
          if (timer.timerId == timerId &&
              timer.timerState != TimerStateEnum.started) {
            _subscriptions[timerId]?.cancel();
            _subscriptions[timerId] = Stream.periodic(_onTickUnit, (x) => x).listen((_) => _onTick(timerId));

            return timer.copyWith(timerState: TimerStateEnum.started);
          }
          return timer;
        },
      ).toList(),
    );

    emit(Loaded(data: timers));
  }

  void pauseTimer({required int timerId}) {
    TimersEntity timers = state.value;

    timers = TimersEntity(
      timers: timers.timers.map(
        (timer) {
          if (timer.timerId == timerId &&
              timer.timerState == TimerStateEnum.started) {
            _subscriptions[timerId - 1]?.cancel();
            return timer.copyWith(timerState: TimerStateEnum.paused);
          }
          return timer;
        },
      ).toList(),
    );

    emit(Loaded(data: timers));
  }

  void resetTimer({required int timerId}) {
    TimersEntity timers = state.value;

    timers = TimersEntity(
      timers: timers.timers.map(
        (timer) {
          if (timer.timerId == timerId) {
            return timer.copyWith(
              timerState: TimerStateEnum.initial,
              currentTime: timer.initialTime,
            );
          }
          return timer;
        },
      ).toList(),
    );

    emit(Loaded(data: timers));
  }
}