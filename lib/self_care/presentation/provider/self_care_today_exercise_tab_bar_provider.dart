import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseTabBarNotifierProvider =
    StateNotifierProvider<ExerciseTabBarNotifier, ExerciseTabBarState>(
  (ref) => ExerciseTabBarNotifier(),
);

final exercisePageControllerProvider = StateProvider<PageController>(
  (ref) => PageController(initialPage: 0),
);

enum ExerciseTabBarState {
  camera,
  gallery,
}

class ExerciseTabBarNotifier extends StateNotifier<ExerciseTabBarState> {
  ExerciseTabBarNotifier() : super(ExerciseTabBarState.camera);

  void changeCamera() {
    state = ExerciseTabBarState.camera;
  }

  void changeGallery() {
    state = ExerciseTabBarState.gallery;
  }
}
