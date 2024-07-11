import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/component/timer_sound_component.dart';
import '../../../home/domain/model/home_today_routines_model.dart';
import '../../domain/model/routine_start_model.dart';

final routineStartExerciseProvider = StateNotifierProvider<RoutineStartExerciseNotifier, RoutineStartModel>((ref) {
  return RoutineStartExerciseNotifier();
});

class RoutineStartExerciseNotifier extends StateNotifier<RoutineStartModel> {
  RoutineStartExerciseNotifier()
      : super(
          RoutineStartModel(
            routineId: -500,
            restTimer: RestTimer(
              initialTime: const Duration(seconds: 20),
              currentTime: const Duration(seconds: 20),
            ),
            exercises: [],
          ),
        );

  final Duration streamTimerValue = const Duration(seconds: 1);
  bool timerStarted = false;
  late StreamSubscription<int> _stream;

  void startTimer(){
    timerStarted = true;
    _stream = Stream.periodic(streamTimerValue, (x) => x,).listen((_) => onTick());
  }

  void cancelTimer(){
    timerStarted = false;
    _stream.cancel();
    state.restTimer = state.restTimer.copyWith(
      initialTime: state.restTimer.initialTime,
      currentTime: state.restTimer.initialTime,
    );
  }

  void setRoutineStartModel(int postId, List<ExerciseInfoList> exerciseInfoList) {
    state = RoutineStartModel.fromModel(
      postId,
      RestTimer(
        initialTime: const Duration(seconds: 20),
        currentTime: const Duration(seconds: 20),
      ),
      exerciseInfoList,
    );
  }

  void setComplete(int exerciseIndex, int setIndex){
    RoutineStartModel dumState = state;
    bool isState = !(dumState.exercises[exerciseIndex].completes![setIndex]);

    dumState.exercises[exerciseIndex].completes![setIndex] = isState;
    state = dumState;

    // 완료를 누르고 timer가 시작되지 않았다면
    if(isState && !timerStarted){
      startTimer();
    }
    // 완료를 누르고 timer가 시작된 상태라면?
    else if(isState && timerStarted){
      cancelTimer();
      startTimer();
    }
  }

  void onTick() {
    if(state.restTimer.currentTime > streamTimerValue){
      state.restTimer.currentTime -= streamTimerValue;
    } else {
      TimerSoundComponent.timerPlay();
      cancelTimer();
    }
  }

  void addRestTime() {
    RestTimer restTimer = state.restTimer;
    const Duration addTime = Duration(seconds: 10);

    if(restTimer.currentTime + addTime < const Duration(hours: 1)){
      if (timerStarted) {
        state.restTimer.currentTime += addTime;
      } else {
        state.restTimer = RestTimer(
          initialTime: restTimer.initialTime + addTime,
          currentTime: restTimer.currentTime + addTime,
        );
      }
    }
  }

  void minusRestTime(){
    RestTimer restTimer = state.restTimer;
    const Duration minusTime = Duration(seconds: 10);

    if(restTimer.currentTime - minusTime > const Duration(seconds: 1)){
      if (timerStarted) {
        state.restTimer.currentTime -= minusTime;
      } else {
        state.restTimer = RestTimer(
          initialTime: restTimer.initialTime - minusTime,
          currentTime: restTimer.currentTime - minusTime,
        );
      }
    }
  }
}

