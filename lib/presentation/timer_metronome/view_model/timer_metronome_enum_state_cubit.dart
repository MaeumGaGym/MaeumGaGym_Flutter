import 'package:flutter_bloc/flutter_bloc.dart';

class IsTimerStateCubit extends Cubit<bool> {
  IsTimerStateCubit() : super(true);

  void changeTimer(){
    emit(true);
  }

  void changeMetronome(){
    emit(false);
  }
}