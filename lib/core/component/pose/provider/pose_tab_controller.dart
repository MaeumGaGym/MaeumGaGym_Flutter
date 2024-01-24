import 'package:flutter_riverpod/flutter_riverpod.dart';

final poseTabController = StateNotifierProvider<PoseTabControllerStateNotifier,
    PoseTabControllerState>((ref) {
  return PoseTabControllerStateNotifier();
});

class PoseTabControllerStateNotifier
    extends StateNotifier<PoseTabControllerState> {
  PoseTabControllerStateNotifier() : super(PoseTabControllerState(index: 0));

  void saveIndex(int index) {
    state = PoseTabControllerState(index: index);
  }
}

class PoseTabControllerState {
  int index;

  PoseTabControllerState({required this.index});
}
