import 'package:flutter_bloc/flutter_bloc.dart';

class TodayRoutinePageStateCubit extends Cubit<int> {
  TodayRoutinePageStateCubit() : super(0);

  void initState(){
    emit(0);
  }

  void changeState(int state){
    emit(state);
  }
}