import 'package:flutter_bloc/flutter_bloc.dart';

class TimerIndexStateCubit extends Cubit<int> {
  TimerIndexStateCubit() : super(0);

  void init(){
    emit(0);
  }

  void changeState(int state){
    emit(state);
  }
}