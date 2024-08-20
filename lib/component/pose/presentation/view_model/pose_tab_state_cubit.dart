import 'package:flutter_bloc/flutter_bloc.dart';

class PoseTabStateCubit extends Cubit<int> {
  PoseTabStateCubit() : super(0);

  void initState() {
    emit(0);
  }

  void changeState(int state) {
    emit(state);
  }

  void changeStateToName(String exerciseName){
    if(exerciseName == "가슴"){
      emit(1);
      // state = 1;
    }
    else if(exerciseName == "등"){
      emit(2);
    }
    else if(exerciseName == "어깨"){
      emit(3);
    }
    else if(exerciseName == "팔"){
      emit(4);
    }
    else if(exerciseName == "복근"){
      emit(5);
    }
    else if(exerciseName == "하체"){
      emit(6);
    }
    else {
      emit(1);
    }
  }
}
