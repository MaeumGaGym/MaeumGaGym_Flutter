import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeTimerAndMetronomeNotifierProvider = StateNotifierProvider<
    HomeTimerAndMetronomeNotifier, HomeTimerAndMetronomeTabBarState>(
  (ref) => HomeTimerAndMetronomeNotifier(),
);

final homeTimerAndMetronomePageController = StateProvider<PageController>(
      (ref) => PageController(initialPage: 0),
);

enum HomeTimerAndMetronomeTabBarState { timer, metronome }

class HomeTimerAndMetronomeNotifier
    extends StateNotifier<HomeTimerAndMetronomeTabBarState> {
  HomeTimerAndMetronomeNotifier()
      : super(HomeTimerAndMetronomeTabBarState.timer);

  void changeTimer() {
    state = HomeTimerAndMetronomeTabBarState.timer;
  }

  void changeMetronome() {
    state = HomeTimerAndMetronomeTabBarState.metronome;
  }
}
