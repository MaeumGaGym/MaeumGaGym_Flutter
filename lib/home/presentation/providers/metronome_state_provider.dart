import 'package:flutter_riverpod/flutter_riverpod.dart';

final metronomeValueProvider =
StateNotifierProvider<MetronomeNotifier, int>((ref) => MetronomeNotifier());

final metronomeStateProvider = StateProvider<bool>((ref) => false);
// false => 플레이 중 x , true => 플레이 중

class MetronomeNotifier extends StateNotifier<int> {
  MetronomeNotifier() : super(120);

  void minus() {
    state--;
  }

  void add() {
    state++;
  }
}
