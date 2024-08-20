import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_timer_duration_model.dart';

enum TimerType { hour, minute, second }

class AddTimerDurationStateCubit extends Cubit<AddTimerDurationModel> {
  AddTimerDurationStateCubit() : super(AddTimerDurationModel(hours: 0, minutes: 0, seconds: 0));

  void init(){
    emit(AddTimerDurationModel(hours: 0, minutes: 0, seconds: 0));
  }
  
  void changeHourState(int value){
    emit(state.copyWith(hours: value));
  }

  void changeMinuteState(int value){
    emit(state.copyWith(minutes: value));
  }

  void changeSecondState(int value){
    emit(state.copyWith(seconds: value));
  }

  String formatTimerTitle(TimerType type){
    switch (type) {
      case TimerType.hour:
        return '시간';
      case TimerType.minute:
        return '분';
      case TimerType.second:
        return '초';
    }
  }

  int timerPickerListLength(TimerType type){
    if(type == TimerType.hour){
      return 24;
    }

    return 60;
  }
}