import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PartSelectorState { all, calisthenics, machine }

final posePartSelectorController = StateNotifierProvider<
    PosePartSelectorControllerStateNotifier, PartSelectorState>((ref) {
  return PosePartSelectorControllerStateNotifier();
});

class PosePartSelectorControllerStateNotifier
    extends StateNotifier<PartSelectorState> {
  PosePartSelectorControllerStateNotifier() : super(PartSelectorState.all);

  void init(int index) {
    // switch (index) {
    //   case 1:
    //     state = PartSelectorState.calisthenics;
    //   case 2:
    //     state = PartSelectorState.machine;
    //   default:
    //
    // }
    state = PartSelectorState.all;
  }

  void clickCalisthenics() {
    if (state == PartSelectorState.calisthenics) {
      state = PartSelectorState.all;
    } else {
      state = PartSelectorState.calisthenics;
    }
  }

  void clickMachine() {
    if (state == PartSelectorState.machine) {
      state = PartSelectorState.all;
    } else {
      state = PartSelectorState.machine;
    }
  }
}
