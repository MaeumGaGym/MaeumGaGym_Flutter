import 'package:flutter_riverpod/flutter_riverpod.dart';

final posePartController = StateNotifierProvider<
    PosePartControllerStateNotifier, PosePartControllerState>((ref) {
  return PosePartControllerStateNotifier();
});

class PosePartControllerStateNotifier
    extends StateNotifier<PosePartControllerState> {
  PosePartControllerStateNotifier()
      : super(PosePartControllerState(calisthenics: false, machine: false));

  void clickCalisthenics() {
    if (state.calisthenics == false) {
      state = PosePartControllerState(
        calisthenics: true,
        machine: false,
      );
    } else {
      state = PosePartControllerState(calisthenics: false, machine: false);
    }
  }

  void clickMachine() {
    if (state.machine == false) {
      state = PosePartControllerState(
        calisthenics: false,
        machine: true,
      );
    } else {
      state = PosePartControllerState(
        calisthenics: false,
        machine: false,
      );
    }
  }
}

class PosePartControllerState {
  bool calisthenics;
  bool machine;

  PosePartControllerState({
    required this.calisthenics,
    required this.machine,
  });
}
