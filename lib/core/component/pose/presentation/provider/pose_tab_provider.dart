import 'package:flutter_riverpod/flutter_riverpod.dart';

// final poseTabController = StateProvider<int>((ref) => 0);

final poseTabController =
StateNotifierProvider<PoseTabStateNotifier, int>(
        (ref) {
      return PoseTabStateNotifier();
    });

class PoseTabStateNotifier extends StateNotifier<int> {
  PoseTabStateNotifier() : super(0);

  void setTabStateToInt(int index){
    state = index;
  }

  void setTabStateToName(String exerciseName){
    if(exerciseName == "가슴"){
      state = 1;
    }
    else if(exerciseName == "등"){
      state = 2;
    }
    else if(exerciseName == "어깨"){
      state = 3;
    }
    else if(exerciseName == "팔"){
      state = 4;
    }
    else if(exerciseName == "복근"){
      state = 5;
    }
    else if(exerciseName == "하체"){
      state = 6;
    }
    else {
      state = 0;
    }
  }
}