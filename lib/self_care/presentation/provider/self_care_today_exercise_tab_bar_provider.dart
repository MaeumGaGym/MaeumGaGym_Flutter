import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TabBar 상태를 관리
final exerciseTabBarNotifierProvider = StateNotifierProvider<ExerciseTabBarNotifier, ExerciseTabBarState>(
  (ref) => ExerciseTabBarNotifier(),
);

/// PageView를 관리하는 Controller를 provider로 변환함.
final exercisePageControllerProvider = StateProvider<PageController>(
  (ref) => PageController(initialPage: 0),
);

/// TabBar 상태
enum ExerciseTabBarState {
  camera,
  gallery,
}

/// Notifier로 바로바로 변경되도록 구현
class ExerciseTabBarNotifier extends StateNotifier<ExerciseTabBarState> {
  ExerciseTabBarNotifier() : super(ExerciseTabBarState.camera);

  void changeCamera() {
    state = ExerciseTabBarState.camera;
  }

  void changeGallery() {
    state = ExerciseTabBarState.gallery;
  }
}
