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
    state = PartSelectorState.all;
  }

  void clickCalisthenics() {
    switch (state) {
      case PartSelectorState.all:
      case PartSelectorState.machine:
        state = PartSelectorState.calisthenics;
      case PartSelectorState.calisthenics:
        state = PartSelectorState.all;
    }
  }

  void clickMachine() {
    switch (state) {
      case PartSelectorState.all:
      case PartSelectorState.calisthenics:
        state = PartSelectorState.machine;
      case PartSelectorState.machine:
        state = PartSelectorState.all;
    }
  }
}
