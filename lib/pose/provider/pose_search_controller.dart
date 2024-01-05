import 'package:flutter_riverpod/flutter_riverpod.dart';

final poseSearchController = StateNotifierProvider<
    PoseSearchControllerStateNotifier, PoseSearchControllerState>((ref) {
  return PoseSearchControllerStateNotifier();
});

class PoseSearchControllerStateNotifier
    extends StateNotifier<PoseSearchControllerState> {
  PoseSearchControllerStateNotifier()
      : super(PoseSearchControllerState(text: ''));

  void saveText(String value) {
    state = PoseSearchControllerState(text: value);
  }

  Future<void> setText() async {
    state = PoseSearchControllerState(text: '');
  }
}

class PoseSearchControllerState {
  String text;

  PoseSearchControllerState({
    required this.text,
  });
}
